class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates :content, presence: true, length: { maximum: 300 }
  has_many :notifications, dependent: :destroy
end
