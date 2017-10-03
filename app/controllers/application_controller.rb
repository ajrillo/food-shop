require 'digest/md5'
REALM = 'localhost'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate #Asks user to sign in on all views

  protected
  def authenticate
    userhash = {}
    User.all.each do |user|
      userhash.store(user.username, user.password)
    end
    authenticate_or_request_with_http_digest(REALM)do|username|
      userhash[username]
    end
  end 

end
