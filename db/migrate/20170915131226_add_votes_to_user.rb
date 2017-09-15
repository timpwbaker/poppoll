class AddVotesToUser < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
    add_column :users, :votes, :hstore, default: {}
    add_index :users, :votes, using: :gin
  end
end
