
get '/users/login' do 
	erb :'/users/login'
end

get '/users/:id' do 
	@user = User.find(params[:id])
	erb :'/users/show'
end
