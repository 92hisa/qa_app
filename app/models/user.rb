class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :answers
  has_many :comments
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { man: 0, woman: 1 }
  validates :name, presence: true, length: { maximum: 50 }

  mount_uploader :profile_image, ImageUploader

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def likes_count
    post_ids = []
    Post.where(user_id: id).each do |p|
      post_ids << p.id
    end
    Like.where(post_id: post_ids).count
  end

  def answers_count
    post_ids = []
    Post.where(user_id: id).each do |p|
      post_ids << p.id
    end
    Answer.where(post_id: post_ids).count
  end
end
