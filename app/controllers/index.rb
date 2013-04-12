get '/' do
  redirect to("/photos")
end

post "/" do 
  Photo.create(params[:photo])
  redirect to("/")
end

get "/photos" do
  @photos = Photo.all
  erb :"photo/index" 
end

get "/photos/:id" do
  @photo = Photo.find(params[:id])
  erb :"photo/show"
end

get "/albums" do
  @photos = Album.all
  erb :"photo/index"
end

get "/albums/:id" do
  @photos = Album.find(params[:id]).photos
  erb :"photo/index"
end