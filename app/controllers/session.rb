post '/sessions' do 
	user = User.authenticate(params[:user])
	if user
		login(user)
		redirect "/users/#{user.id}"
	else
		redirect '/'
	end
end

get '/logout' do 
	logout
	redirect '/'
end