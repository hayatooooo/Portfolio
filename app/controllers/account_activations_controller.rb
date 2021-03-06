class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    #アカウント有効化のダイジェストと、渡されたトークンが一致するかどうかをチェック
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "アカウントを有効化しました！"
      redirect_to user
    else
      flash[:danger] = "アカウント有効化のためのリンクが無効になっています。"
      redirect_to root_url
    end
  end
end