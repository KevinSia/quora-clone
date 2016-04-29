# upvote
post '/questions/:id/up' do
  # request.xhr?
  @vote = current_user.question_votes.find_or_create_by(question_id: params[:id])
  @vote.update_attributes(point: 1)
  redirect back
end

# downvote
post '/questions/:id/down' do
  # request.xhr?
  @vote = current_user.question_votes.find_or_create_by(question_id: params[:id])
  @vote.update_attributes(point: -1)
  redirect back
end