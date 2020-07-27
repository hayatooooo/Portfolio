class Talk < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, class_name: "User", through: :memberships, source: :user
  has_many :dmessages, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  #DM先の対象者の名前をタイトルとして表示
  def title(current_user)
    other_members = members.select{ |member| current_user != member }
    title = other_members.collect{ |member| member.name }.join(", ")
  end
  
  #最後のメッセージを表示
  def latest_message
    dmessages.last if dmessages.count > 0
  end

  #トークルームからぬける
  def leave(user)
    membership = memberships.find_by(user: user)
    return false if membership.nil?
    !!(membership.destroy)
  end
end
