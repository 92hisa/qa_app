class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string "title", null: false
      t.string :post_image
      t.text "content", null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
