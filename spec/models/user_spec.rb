require 'spec_helper'

describe User do
	  it { should validate_presence_of :email }
		it "should have many meals" do
			m = User.reflect_on_association(:meals)
			m.macro.should == :has_many
		end
end
