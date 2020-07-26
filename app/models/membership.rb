class Membership < ApplicationRecord
  after_destroy :destroy_empty_talk
  belongs_to :talk
  belongs_to :user
  validates :user_id, uniqueness: { scope: :talk_id }
  
  private
  
  #メンバーが誰もいない場合、トークルーム削除   
  def destroy_empty_talk
    talk.destroy if talk.reload.memberships.empty?
  end
end
