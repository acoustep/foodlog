require 'spec_helper'

describe Api::MealsController do
	let(:meals) do 
		x = 4
		Fabricate.times(3, :meal) do 
			user_id x
			x = x + 1
		end 
	end
	let(:user) { Fabricate(:user) }
	before { meals }
	before { user } # initialize it
	describe 'GET index' do
		context 'unauthorized' do
			before { get :index }

			it 'returns http 401' do
				response.response_code.should == 401
			end
		end

		context 'authorized' do
			before do
				user.ensure_authentication_token!
				get :index, auth_token: user.authentication_token
			end
			# before { get :index }
			subject { JSON.parse response.body }
			it 'wraps around meals' do should include 'meals' end
			it 'returns http 200' do
				response.response_code.should == 200
			end
			it 'should not show other users meals' do
				parsed_body = JSON.parse(response.body)
				# number of meals with user_id not one should be zero
				parsed_body["meals"].select{|key| key["user_id"] != 4 }.count.should == 0
			end
		end
	end
#
	describe 'GET show' do
		context 'unauthorized' do
			before { get :show, id: meals.first.id }

			it 'returns http 401' do
				response.response_code.should == 401
			end

			it "returns 401 on someone else's meal" do
				user.ensure_authentication_token!
				get :show, id: meals.last.id, auth_token: user.authentication_token
				response.response_code.should == 401
			end
		end

		context 'authorized' do
			# before { get :show, id: 1 }
			before do
				user.ensure_authentication_token!
				get :show, id: meals.first.id, auth_token: user.authentication_token
			end
			it 'returns http success' do
				response.should be_success
			end
			# before { get :show, id: meal.id }
			subject { JSON.parse response.body }

			it 'wraps around meal' do should include 'meal' end
			context 'inside meal' do
				subject { JSON.parse(response.body)['meal'] }
				it { should include 'id' }
				it { should include 'name' }
				it { should include 'user_id' }
				it { should include 'quantity' }
			end

			it 'returns http 200' do
				response.response_code.should == 200
			end

		end
	end

	describe 'POST create' do
		context 'no param' do
			# post :create not working
			before { post :index }

			it_behaves_like 'http code', 401 # DRYed up
		end
	end
end
