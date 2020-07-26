class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    #リクエストで指定されたフォーマット（HTML,JSON,XML）に合わせて結果を返す
    respond_to do |format|
      #formatがhtml形式、
      #該当ページに遷移する直前に閲覧されていた参照元（遷移元・リンク元）ページのURLにリダイレクト
      format.html { redirect_to @user }
      #formatがjson形式
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end