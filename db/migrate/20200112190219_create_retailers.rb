class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.string :name
      t.integer :boxes
      t.integer :user_id
    end
  end
end
