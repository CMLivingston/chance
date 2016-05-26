class MatchesController < ApplicationController
	
	def new
		@match = Match.new
	end

	def index
		# list all matches for user a
	end
	
	def create
		@match = Match.new(match_params)	
		@match.user_id = current_user.id
		respond_to do |f|
			if (@match.save)
				f.html{redirect_to "", notice: "Post created!"}
			else
				f.html{redirect_to "", notice: "Error: Match not saved."}
			end
		end
	end



	private 

	def post_params
		params.require(:match).permits(:user_id, :content, :meet_uptime, :sent)
	end
end