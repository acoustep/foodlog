class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.belongs_to :user
      t.string :name
      t.integer :quantity
      t.datetime :time
    end
  end
end
