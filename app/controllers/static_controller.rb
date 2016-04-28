before do
  paths = ['/login', '/signup', '/signin']
  pass if logged_in? || paths.include?(request.path_info)
  @error_messages = 'You must login to access this page!'
  redirect to '/login'
end

get '/' do
  if logged_in?
    redirect to '/home'
  else
    erb :"static/index"
  end
end

get '/home' do
  @questions = Question.includes(:user).all
  erb :'questions/index'
end