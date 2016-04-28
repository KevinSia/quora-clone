# show all questions (same action with /home)
get '/questions' do
  @questions = Question.includes(:user).all.order(created_at: :desc)
  erb :'questions/index'
end

# render a page with form to submit a question
get '/questions/new' do
  erb :'questions/new'
end

# show a question (along with its answers)
get '/questions/:id' do
  @question = Question.includes(:answers).find(params[:id])
  @upvotes = @question.votes.where(point: 1).count
  @downvotes = @question.votes.where(point: -1).count
  erb :'questions/show'
end


# create a question object and redirect back to index page
post '/questions' do
  params[:question][:user_id] = current_user.id
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @error_message = "Invalid input :( Please try again!"
    erb :'questions/new'
  end
end

# render a page to edit a question
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

# update a question and redirect to show page
# todo : make put request
post '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.update(params[:question])
    redirect to "/questions/#{@question.id}"
  else
    @error_message = "Invalid input :( Please try again!"
    erb :'questions/edit'
  end
end

# deletes a question with a button
# todo : make into form, show confirm box and send ajax request
get '/questions/:id/delete' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect to "/home"
end
