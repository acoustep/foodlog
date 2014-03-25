require 'spec_helper'

describe Meal do
	it { should have_db_column :name }
	it { should have_db_column :user_id }
	it { should have_db_column :quantity }
	it { should have_db_column :time }
	it { should belong_to(:user) }
end

