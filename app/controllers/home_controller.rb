require 'digest/md5'
REALM = 'localhost'

class HomeController < ApplicationController
  #skip_before_filter is used so I dont need to sign in on these three views,
  #as my :authenticate runs on all views
  skip_before_filter :authenticate, :only => [:index, :login, :user]
  
  def index
    @datetime = DateTime.now
    @promotions = Promotion.all

    @username = ''
    @password = ''
    @email = ''
    @aUser = 0
    if !params[:username].nil?
      @username = params[:username]
    end

    if !params[:password].nil?
      @password= params[:password]
    end

    if !params[:email].nil?
      @email = params[:email]
    end

    print @username
    print @email
    @newUser = nil
    @newUser = User.new
    @newUser.username = @username
    @newUser.email = @email
    @newUser.password = Digest::MD5.hexdigest([@username, REALM, @password].join(":"))
    @newUser.save

    @aUser =  User.where('id = ?', @newUser.id)
    @aUser = @aUser.length
    flash.now.alert = "New User Created"
  end

  def about
  end

  def contact
  end

  def search
    @results=0
    if !params[:searchinput].nil?
      @results=1
      @searchinput = params[:searchinput]
      @searchcriteria="%"+@searchinput+"%"
      @sandwiches = Order.where("sandwich like ?",@searchcriteria)
    end
  end

  def login
  end
  
  def logout
  end

  def user
    userhash = {}
    @myUser = ''
    User.all.each do |user|
      userhash.store(user.username, user.password)
    end
    authenticate_or_request_with_http_digest(REALM)do|username|
      userhash[username]
      @myUser = User.where('username = ?', username)
    end

    if !@myUser.nil?
      @myUser = @myUser[0]
      @preferenceID = @myUser.preferences
      @orders = Order.where('id = ?', @preferenceID)
    end
  end

end
