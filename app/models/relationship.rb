class Relationship < ApplicationRecord
  #クラス名変更
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  #フォローメール
  def Relationship.send_follow_email(user, follower)
      RelationshipMailer.follow_notification(user, follower).deliver_now
  end

  #フォロー解除メール
  def Relationship.send_unfollow_email(user, follower)
      RelationshipMailer.unfollow_notification(user, follower).deliver_now
  end
end