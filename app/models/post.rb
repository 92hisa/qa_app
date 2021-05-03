class Post < ApplicationRecord
  belongs_to :user

  enum status: { open: 0, close: 1 }
  mount_uploader :post_image, ImageUploader


end
