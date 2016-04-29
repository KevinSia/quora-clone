get '/' do
  if logged_in?
    redirect to '/home'
  else
    erb :"static/index"
  end
end

get '/home' do
  @questions = Question.includes(:votes, :user).all.order(created_at: :desc)
  @upvotes = QuestionVote.group(:question_id).where(point: 1).count
  @downvotes = QuestionVote.group(:question_id).where(point: -1).count
  erb :'questions/index'
end