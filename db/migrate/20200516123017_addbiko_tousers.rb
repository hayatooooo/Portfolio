class AddbikoTousers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :category_id, :integer
    add_column :users, :sub_category_id, :integer
            add_column :users, :biko, :string
    add_index :users, [:category_id, :sub_category_id]
    add_index :users, :sub_category_id
  end
end
