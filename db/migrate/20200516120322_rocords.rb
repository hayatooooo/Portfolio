class Rocords < ActiveRecord::Migration[5.1]
  def change
     drop_table :sb_categories
  end
end
