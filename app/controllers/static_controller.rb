get '/' do
  if logged_in?
    redirect to '/home'
  else
    erb :"static/index"
  end
end

get '/home' do
  @questions = Question.includes(:user).all.order(updated_at: :desc)
  erb :'questions/index'
end