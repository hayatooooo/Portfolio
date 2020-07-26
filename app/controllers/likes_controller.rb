class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    #「いいね」していないときの処理
    unless @micropost.iine?(current_user)
      @micropost.iine(current_user)
      @micropost.reload
      #リクエストで指定されたフォーマット（HTML,JSON,XML）に合わせて結果を返す
      respond_to do |format|
        #formatがhtml形式、
        #該当ページに遷移する直前に閲覧されていた参照元（遷移元・リンク元）ページのURLにリダイレクト
        format.html { redirect_to request.referrer || root_url }
        #formatがjson形式
        format.js
      end
    end
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    #「いいね」済みの処理
    if @micropost.iine?(current_user)
      @micropost.uniine(current_user)
      @micropost.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end