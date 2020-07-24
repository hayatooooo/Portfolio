class Talk < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, class_name: "User", through: :memberships, source: :user
  has_many :dmessages, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  def title(current_user, length=100)
    counter = " (#{members.count})"
    length -= counter.length
    other_members = members.select{ |member| current_user != member }
    title = other_members.collect{ |member| member.name }.join(', ')
    title = title[0...length] + '...' if title.length > length
    if other_members.count > 2
      title + counter
    else
      title
    end
  end
  
  def latest_message
    dmessages.last if dmessages.count > 0
  end

  def leave(user)
    membership = memberships.find_by(user: user)
    return false if membership.nil?
    !!(membership.destroy)
  end
end
