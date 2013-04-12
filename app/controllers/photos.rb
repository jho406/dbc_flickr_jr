get "/photos" do
  @photos = Photo.all
  @base_url = "/photos"
  erb :"photo/index" 
end

get "/photos/new" do
  authenticate!
  erb :"photo/new"
end

get "/photos/:id" do
  @photo = Photo.find(params[:id])
  erb :"photo/show"
end


post "/photos/new" do
  authenticate!
  photo = Photo.create(params[:photo])
  redirect back
end