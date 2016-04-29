# find_or_create_by
post '/answers/:id/up' do
  # request.xhr?
  @vote = current_user.answer_votes.find_or_create_by(answer_id: params[:id])
  @vote.update_attributes(point: 1)
  redirect back
end

# downvote
post '/answers/:id/down' do
  # request.xhr?
  @vote = current_user.answer_votes.find_or_create_by(answer_id: params[:id])
  @vote.update_attributes(point: -1)
  redirect back
end