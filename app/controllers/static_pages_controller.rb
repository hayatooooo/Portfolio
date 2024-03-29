class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
        @q = current_user.feed.ransack(microposts_search_params)
        @feed_items = @q.result.paginate(page: params[:page], :per_page => 5)
        @talks = current_user.talks.paginate(page: params[:talks_page], :per_page => 5)
      else
        @q = Micropost.none.ransack
        @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 5)
        @talks = current_user.talks.paginate(page: params[:talks_page], :per_page => 5)
      end
      @url = root_path
    end
  end

  def dmhome
    if logged_in?
      @talks = current_user.talks.paginate(page: params[:talks_page], :per_page => 5)
    end
      @url = root_path
  end
end
