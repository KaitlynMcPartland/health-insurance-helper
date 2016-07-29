get '/users/new' do

	erb :'/users/new'
end

post '/users/new' do
	@user = User.new(params[:user])
	#create a new cat instance which generates a random cat image via the cat API
	@cat = Cat.new
	#assign the url of that unique cat instance to the user cat_img attribute
	#url is nested deeply in a hash
	@user.cat_img = @cat.create_url["response"]["data"]["images"]["image"]["url"]

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
