# upvote
post '/questions/:id/up' do
  @vote = current_user.question_votes.where(question_id: params[:id]).first
  @vote ||= current_user.question_votes.create(question_id: params[:id])
  @vote.update_attributes(point: 1)
  redirect to "/questions/#{params[:id]}"
end

# downvote
post '/questions/:id/down' do
  @vote = current_user.question_votes.where(question_id: params[:id]).first
  @vote ||= current_user.question_votes.create(question_id: params[:id])
  @vote.update_attributes(point: -1)
  redirect to "/questions/#{params[:id]}"
end