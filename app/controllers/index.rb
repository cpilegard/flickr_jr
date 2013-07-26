get '/' do
  @photos = Photo.all
  erb :index
end

# post '/upload' do
#   photo = Photo.new
#   photo.file = params[:image]
#   photo.save
#   redirect to('/')
# end

get '/user' do
  erb :signup
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

get '/logout' do
  session.clear
  redirect '/'
end

get '/albums' do
  @albums = current_user.albums
  erb :album
end

post '/albums' do
  album = current_user.albums.create(title: params[:title])
  redirect '/albums'
end

get '/albums/:id' do
  @photos = current_user.albums.find(params[:id]).photos
  @album = Album.find(params[:id])
  erb :show_album
end

post '/albums/:id' do
  photo = current_user.albums.find(params[:id]).photos.new()
  photo.file = params[:image]
  photo.save
  redirect "/albums/#{params[:id]}"
end