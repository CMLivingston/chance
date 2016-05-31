class UsersController < ApplicationController
	def search
		# user will be signed in here, no need to authenticate
		@q = "%#{params[:query]}%"
		@results = User.where("first_name LIKE ? or last_name LIKE ? or email LIKE ?", @q, @q, @q)
		#byebug
		render 'users/search_results'
	end


	def add_user_to_list
		
		@u = "#{params[:u_id]}"
		#byebug
		begin
			@user = User.find(@u)
		rescue
			raise "Could not find user with id : #{@u}"
		end

		# silently check and add or not if already in your list...you know better
		if !current_user.following?(@user)
			current_user.add_to_list(@user)
		end

		redirect_to '/'

	end
end
