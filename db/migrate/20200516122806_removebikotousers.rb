class Removebikotousers < ActiveRecord::Migration[5.1]
  def change
        remove_column :users, :biko, :string
            remove_column :users, :league_id, :integer
                remove_column :users, :team_id, :integer
  end
end
