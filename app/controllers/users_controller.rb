class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                          :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
      
  def index
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = User.ransack(search_params, activated_true: true)
      @title = "Search Result"
    else
      @q = User.ransack(activated_true: true)
      @title = "All supporters"
    end
    @users = @q.result.paginate(page: params[:page], :per_page => 5)
  end
  
  def show
    @user = User.find(params[:id])
    @category = @user.category_id
    @subcategory = @user.sub_category_id
    @microposts = @user.microposts.paginate(page: params[:page], :per_page => 5)
  end
  
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを確認して、アカウントを有効にしてください。"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "アカウント情報を更新しました。"
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました。"
    redirect_to users_url
  end
  
  def following
    @title = "Follows"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], :per_page => 5)
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], :per_page => 5)
    render "show_follow"
  end

  private
  
  def search_params
    #name_cont→検索対象
    params.require(:q).permit(:name_cont)
  end
    
  def user_params
    params.require(:user).permit(:name, :email,
                               :password, :password_confirmation,
                               :follow_notification,
                               :category_id,:sub_category_id,:introduction)
  end
  
  # beforeアクション
    
  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
   
  # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end