before /\/?users?\/?\S*/ do
  unless logged_in?
    @error_messages = 'Please log in to join the community'
    redirect to '/login'
  end
end

get '/users/index' do
  @users = User.all
  erb :'users/index'
end

get 'users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end
