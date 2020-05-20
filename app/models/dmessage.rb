class Dmessage < ApplicationRecord
  belongs_to :talk
  belongs_to :user
  validates :talk_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  after_destroy :destroy_empty_talk
  
  private
    
  def destroy_empty_talk
    talk.destroy if talk.reload.memberships.empty?
  end
    
end
