class AccessController < ApplicationController
 def username 
@user = User.find session[:user_id]
 end


end
