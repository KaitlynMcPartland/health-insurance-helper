get '/users/new' do 

	erb :'/users/new'
end

post '/users/new' do
	@user = User.new(params[:user])
	if @user.save
		login(@user)
		redirect "/users/#{@user.id}"
	else
		redirect '/users/new'
	end
end


get '/users/:id' do 
	@user = User.find(params[:id])
	erb :'/users/show'
end

get '/users/:id/edit' do

	erb :'/users/edit'
end