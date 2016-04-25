get '/' do
  if logged_in?
    redirect to 'users/index'
  else
    erb :"static/index"
  end
end