get '/' do
  redirect to("/photos")
end

post "/" do 
  Photo.create(params[:photo])
  redirect to("/")
end

get "/albums" do
  @photos = Album.all
  erb :"photo/index"
end


get "/albums/new" do
  erb :"album/new"
end

get "/albums/:id" do
  @photos = Album.find(params[:id]).photos
  erb :"photo/index"
end