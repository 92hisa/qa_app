class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum status: { open: 0, close: 1 }
  mount_uploader :post_image, ImageUploader


end
