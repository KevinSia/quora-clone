# create a new answer under the question and current_user
post '/questions/:question_id/answers/new' do
  params[:answer][:user_id] = current_user.id
  params[:answer][:question_id] = params[:question_id]
  @answer = Answer.new(params[:answer])

  unless @answer.save
    @error_message = "Invalid input :( Please try again!"
  end

  redirect to "/questions/#{params[:question_id]}"
end

# show edit page
get '/answers/:answer_id/edit' do
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

# updates an answer
post '/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  if @answer.update(params[:answer])
    redirect to "/questions/#{@answer.question.id}"
  else
    @error_message = "Invalid input :( Please try again!"
    erb :'answers/edit'
  end
end

# delete an answer
get '/answers/:answer_id/delete' do
  @answer = Answer.find(params[:answer_id])
  @answer.destroy
  redirect to "/questions/#{@answer.question.id}"
end