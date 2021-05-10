class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :answers
  has_many :notifications, dependent: :destroy

  enum status: { open: 0, close: 1 }
  mount_uploader :post_image, ImageUploader
  validates :title, presence: true, length: { minimum: 5 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :category_id, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { maximum: 1000 }

  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_answer!(current_user, answer_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Answer.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_answer!(current_user, answer_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_answer!(current_user, answer_id, user_id) if temp_ids.blank?
  end

  def save_notification_answer!(current_user, answer_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      answer_id: answer_id,
      visited_id: visited_id,
      action: 'answer'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
