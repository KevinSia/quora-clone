# show a users profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile'
end

# show all questions of the user
get '/users/:id/questions' do
  @user = User.find(params[:id])
  @questions = @user.questions.order(updated_at: :desc)
  if @questions
    erb :'users/questions'
  else
    @error = "You have no questions :("
    erb :'users/error'
  end
end

# show all answers of the user
get '/users/:id/answers' do
  @user = User.find(params[:id])
  @answers = @user.answers.order(updated_at: :desc)
  if @answers
    erb :'users/answers'
  else
    @error = "You have not answered once :("
    erb :'users/error'
  end
end