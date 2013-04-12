
get "/users" do
  @photos = User.all
  erb :"photo/index"
end

get "/users/new" do
  erb :"user/new"
end

post "/users/new" do
  user = User.create(:name=>params[:user][:name])
  session[:user_id] = user.id
  redirect "/users/#{user.id}/albums"
end

get "/users/:id/albums" do
  @photos = User.find(params[:id]).albums
  erb :"photo/index"
end

get "/users/:user_id/albums/:album_id" do
  user = User.find(params[:user_id])
  album = user.albums.find(params[:album_id])
  @photos = album.photos.all
  erb :"photo/index"
end