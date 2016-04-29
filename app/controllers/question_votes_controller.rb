# upvote
post '/questions/:id/up' do
  # request.xhr?
  @vote = current_user.question_votes.find_or_create_by(question_id: params[:id])
  @vote.update_attributes(point: 1)
  if request.xhr?
    upvotes = Question.find(params[:id]).upvote_count
    downvotes = Question.find(params[:id]).downvote_count
    hash = { upvotes:  "Upvoted! (#{upvotes})", downvotes: "Downvote (#{downvotes})", q_id: params[:id] }
    hash.to_json
  else
    redirect back
  end
end

# downvote
post '/questions/:id/down' do
  # request.xhr?
  @vote = current_user.question_votes.find_or_create_by(question_id: params[:id])
  @vote.update_attributes(point: -1)
  if request.xhr?
    upvotes = Question.find(params[:id]).upvote_count
    downvotes = Question.find(params[:id]).downvote_count
    hash = { upvotes:  "Upvote (#{upvotes})", downvotes: "Downvoted! (#{downvotes})", q_id: params[:id] }
    hash.to_json
  else
    redirect back
  end
end
