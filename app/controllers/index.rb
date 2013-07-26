get '/' do
  @photos = Photo.all
  erb :index
end

post '/upload' do
  photo = Photo.new
  photo.file = params[:image]
  photo.save
  redirect to('/')
end

post '/user' do
  user = User.create(username: params[:username], password: params[:password])
  session[:user] = user.id
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user.password == params[:password]
    session[:user] = user.id
    redirect '/'
  else
    redirect '/'
  end
end