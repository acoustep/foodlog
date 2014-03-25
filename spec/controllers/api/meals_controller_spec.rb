require 'spec_helper'

describe Api::MealsController do
	let(:meal) { Fabricate(:meal) }
	before { meal }
	describe 'GET index' do
		before { get :index }
		subject { JSON.parse response.body }
#
		it 'wraps around meals' do should include 'meals' end
#
		it 'returns http 200' do
			response.response_code.should == 200
		end
#
	end
#
	describe 'GET show' do
		before { get :show, id: 1 }
		it 'returns http success' do
			response.should be_success
		end
		before { get :show, id: meal.id }
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

