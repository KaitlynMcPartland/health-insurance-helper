get '/sessions/new' do 
	erb :'/sessions/new'
end

post '/sessions' do 
	user = User.authenticate(params[:user])
	if user
		login(user)
		redirect "/users/#{user.id}"
	else
		@error = "Invalid log in"
		redirect '/sessions/new'
	end
end

get '/sessions/logout' do 
	logout
	redirect '/'
end