class CreateDmessages < ActiveRecord::Migration[5.1]
  def change
    create_table :dmessages do |t|
      t.references :talk, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.timestamps
    end
        add_index :dmessages, [:updated_at, :talk_id]
  end
end
