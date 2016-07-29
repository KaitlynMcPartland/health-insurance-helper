
get '/' do
  # Look in app/views/index.erb
  @cat = Cat.new
  erb :'cats/show'
end
