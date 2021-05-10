class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  has_many :notifications, dependent: :destroy
  validates :content, presence: true, length: { maximum: 300 }
end
