# session validation
before do
  paths = ['/login', '/signup', '/signin', '/']
  pass if logged_in? || paths.include?(request.path_info)
  @error_messages = 'You must login to access this page!'
  redirect to '/login'
end

get '/signup' do
  erb :'session/signup'
end

post '/signup' do
  @user = User.new(params[:user])
  @user.save_password = params[:password]
  if @user.save
    login @user
    redirect to '/'
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
    redirect to '/'
  else
    @error_messages = "Invalid email or password. Please try again"
    erb :'session/login'
  end
end

get '/logout' do
  logout
  redirect to '/'
end