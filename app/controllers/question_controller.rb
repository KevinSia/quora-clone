# show all questions (same action with /home)
get '/questions' do
  @questions = Question.includes(:users).all
  erb :'questions/index'
end

# render a page with form to submit a question
get '/questions/new' do
  erb :'questions/new'
end

# show a question (along with its answers)
get '/questions/:id' do
  @question = Question.includes(:answers).find(params[:id])
  erb :'questions/show'
end


# create a question object and redirect back to index page
post '/questions' do
  byebug
  params[:question][:user_id] = current_user.id
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @error_message = 'Invalid input :( Please try again!'
    erb :'questions/new'
  end
end

# render a page to edit a question
get '/questions/:id/edit' do
end

# update a question and redirect to show page
# todo : make put request
post '/questions/:id' do
end

# deletes a question with a button
# todo : make delete request
get '/questions/:id/delete' do
end
