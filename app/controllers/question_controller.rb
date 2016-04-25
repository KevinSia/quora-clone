['/question/*', '/questions', 'questions/*'].each do |path|
  before path do
    unless logged_in?
      @error_messages = 'Log in to join the community!'
      redirect to '/login'
    end
  end
end

get '/question/:id' do
end