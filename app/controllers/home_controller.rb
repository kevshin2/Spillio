class HomeController < ApplicationController

	def index
		if (not session[:cas_user].nil?) and User.exists_with_cid? session[:cas_user]
			authenticated_user = User.find_by_cid(session[:cas_user])
			redirect_to student_path authenticated_user
		end
	end
end