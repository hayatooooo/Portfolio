class DmessagesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy
  
  def destroy
    @talk = @dmessage.talk
    @dmessage.destroy
    flash[:success] = "メッセージを削除しました。"
    redirect_to @talk
  end
  
  private
  
  #destroyの前に正しいユーザーか確認  
  def correct_user
    @dmessage = current_user.dmessages.find_by(id: params[:id])
    redirect_to root_url if @dmessage.nil?
  end
end
