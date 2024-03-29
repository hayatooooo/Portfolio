class MembershipsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy
  
  #トークルーム作成
  def create
    @talk = Talk.find(params[:talk_id])
    params[:guest_users].each do |guest_user|
      if @talk.member?(guest_user)
      else
        @talk.add_member(guest_user)
      end
    end
  end

  def destroy
    @membership.destroy
    flash[:success] = "トークルームを削除しました。"
    redirect_back(fallback_location: root_url)
  end
  
  private
    
  def correct_user
    @membership = current_user.memberships.find_by(id: params[:id])
    redirect_to root_url if @membership.nil?
  end
end