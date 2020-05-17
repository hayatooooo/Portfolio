class CreateSubCategories < ActiveRecord::Migration[5.1]
 def change
    create_table :sub_categories do |t|
      t.string :name
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end