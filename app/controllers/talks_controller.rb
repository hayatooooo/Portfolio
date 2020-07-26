class TalksController < ApplicationController
  before_action :logged_in_user
  before_action :correct_member, only: [:show, :dmessages]
  
  def show
    @dmessages = @talk.dmessages
    @dmessage = Dmessage.new
  end
  
  def create
    @talk = Talk.new
    @talk.memberships.build(user_id: current_user.id)
    @talk.save
    redirect_to @talk
  end
  
  def dmessages
    @dmessage = Dmessage.new(dmessage_params)
    # touchメソッドでupdate_atのみを更新(トークの更新日時を更新)
    @talk.touch
    if @dmessage.save
      redirect_to @talk
    else
      @dmessages = @talk.dmessages
      render "show"
    end
  end
  
  private
    
  def dmessage_params
    params[:dmessage].merge!({ user_id: current_user.id, talk_id: @talk.id })
    params.require(:dmessage).permit(:user_id, :talk_id, :content)
  end
    
  def correct_member
    @talk = current_user.talks.find_by(id: params[:id])
    redirect_to root_url if @talk.nil?
  end
    
  def correct_user
    @dmessage = current_user.dmessages.find_by(id: params[:id])
    redirect_to root_url if @dmessage.nil?
  end
end
