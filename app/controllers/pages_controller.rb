class PagesController < ApplicationController
  def index
  end

  def home
    # bind data to @s for watchlist and matchlist if user is signed in (home page)
    if user_signed_in?
      @following = current_user.following
      @watch_count = current_user.following.count
      @matches = current_user.matches
    end
  end

  def remove_user_from_list
    
    @u = "#{params[:u_id]}"
    #byebug
    begin
      @user = User.find(@u)
    rescue
      raise "Could not find user with id : #{@u}"
    end

    current_user.unfollow(@user)
    redirect_to :back

  end

  def profile
  	#@newMatch = Match.new
  end

  def matches
  	#@newMatch = Match.new
  end
end
