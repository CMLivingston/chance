class UsersController < ApplicationController
	def search
		# user will be signed in here, no need to authenticate
		@q = "%#{params[:query]}%"
		@results = User.where("first_name LIKE ? or last_name LIKE ? or email LIKE ?", @q, @q, @q)
		#byebug
		render 'users/search_results'
	end
end
