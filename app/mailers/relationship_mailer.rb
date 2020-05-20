class RelationshipMailer < ApplicationMailer

  def follow_notification(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: "#{@follower.name} があなたをフォローしました。"
  end

  def unfollow_notification(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: "#{@follower.name} があなたのフォローを解除しました。"
  end
end