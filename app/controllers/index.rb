get '/' do
  @photos = Photo.all
  erb :index
end

post '/upload' do
  File.open('public/' + params[:file][:filename], 'w') do |f|
    f.write(params[:file][:tempfile].read)
  end
  return "File uploaded"
end
