class AddNameToUser < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :name, :string, null: false
    add_column :users, :profile_image, :string
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :birth_date, :date, null: false
  end
end
