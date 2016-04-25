get '/signup' do
  erb :'session/signup'
end

post '/signup' do
  @user = User.new(params[:user])
  @user.digest_password = params[:password]
  if @user.save
    erb :'users/index'
  else
    @error_messages = @user.errors.messages
    erb :'session/signup'
  end
end

get '/login' do
  erb :'session/login'
end