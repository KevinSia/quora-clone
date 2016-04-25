get '/signup' do
  erb :'session/signup'
end

post '/signup' do
  @user = User.new(params[:user])
  @user.save_password = params[:password]
  if @user.save
    login @user
    erb :'users/index'
  else
    @error_messages = @user.errors.messages
    erb :'session/signup'
  end
end

get '/login' do
  @error_messages = session[:error]
  erb :'session/login'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    login @user
    erb :'users/index'
  else
    @error_messages = "Invalid email or password. Please try again"
    erb :'session/login'
  end
end

get '/logout' do
  logout
  erb :'static/index'
end