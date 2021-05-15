class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :answers
  has_many :comments
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum gender: { man: 0, woman: 1 }
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :encrypted_password, :password, :password_confirmation, length: { minimum: 7 },
                                                                    format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ },
                                                                    unless: -> { validation_context == :update }
  validates :password, confirmation: true, unless: -> { validation_context == :update }
  validates :password_confirmation, presence: true, unless: -> { validation_context == :update }

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

  def active_for_authentication?
    super && (self.is_deleted == false)
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

  def self.guest
    user = User.find_or_create_by!(email: 'keiken.kanri@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation= user.password
      user.birth_date = 1900-01-01
      user.confirmed_at = Time.now
      user.name = "ゲスト"
    end
  end
end
