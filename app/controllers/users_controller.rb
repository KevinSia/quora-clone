['/user/*', '/users/*'].each do |path|
  before path do
    unless logged_in?
      @error_messages = 'Log in to join the community!'
      redirect to '/login'
    end
  end
end

get '/users/index' do
  @users = User.all
  erb :'users/index'
end

# users#show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end

