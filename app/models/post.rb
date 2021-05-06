class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :answers

  enum status: { open: 0, close: 1 }
  mount_uploader :post_image, ImageUploader

  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end


end
