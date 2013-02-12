class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.friends.count < 1
      redirect_to root_path
      @api = Koala::Facebook::API.new(current_user.oauth_token)
      @graph_friends = @api.get_object("/me/friends?limit=2", "fields"=>"id, name")
      @graph_friends.each do |friend|
        @friend = current_user.friends.create(:name => friend['name'], :facebook_id => friend['id'].to_i, :picture => 'https://graph.facebook.com/' + friend['id'] + '/picture/fields=cover')
        @user_friends = current_user.friends.all
        @user_friends.each do |id|
          @friend_db = @api.get_object(id.facebook_id.to_s + "/photos?limit=1")
          @friend_db.each do |photo|
            Photo.create(:url => photo['source'], :friend_id => id.id, :name => photo['name'], :create_date => photo['created_time'], :update_date => photo['updated_time'])
          end
        end
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def refresh
    redirect_to root_url
    @api = Koala::Facebook::API.new(current_user.oauth_token)
    @graph_friends = @api.get_object("/me/friends?limit=6", "fields"=>"id, name")
    @graph_friends.each do |friend|
      @friend = current_user.friends.create(:name => friend['name'], :facebook_id => friend['id'].to_i, :picture => 'https://graph.facebook.com/' + friend['id'] + '/picture/fields=cover')
      @user_friends = current_user.friends.all
      @user_friends.each do |id|
        @friend_db = @api.get_object(id.facebook_id.to_s + "/photos?limit=3")
        @friend_db.each do |photo|
          Photo.create(:url => photo['source'], :friend_id => id.id, :name => photo['name'], :create_date => photo['created_time'], :update_date => photo['updated_time'])
        end
      end
    end
  end
  
  def asign_group
    group = Group.find(params[:group_id])
    group.name = params[:name]
    group.save
    redirect_to :back
  end
  
end
