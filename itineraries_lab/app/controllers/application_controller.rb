class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  # private
  #   def find_entity
  #     params.each do |name, value|
  #       if name == 'controller'
  #         @entity = value.classify.constantize.find(params[:id]) || nil
  #       end
  #     end
  #   end

end
