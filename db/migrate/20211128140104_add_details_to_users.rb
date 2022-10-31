class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :grade, :string
    add_column :users, :passed, :boolian
    add_column :users, :twitter_id, :string
    add_column :users, :instagram_id, :string
    add_column :users, :image, :string
  end
end
