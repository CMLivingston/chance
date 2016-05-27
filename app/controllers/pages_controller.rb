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

  def profile
  	#@newMatch = Match.new
  end

  def matches
  	#@newMatch = Match.new
  end
end
