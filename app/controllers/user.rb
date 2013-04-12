
get "/users" do
  @photos = User.all
  @base_url = "/users"

  erb :"photo/index"
end

get "/users/new" do
  erb :"user/new"
end

get "/users/login" do
  erb :"user/login"
end

post "/users/login" do
  user = User.find_by_name(params[:user][:name])
  session[:user_id] = user.id
  redirect "/users/#{user.id}/albums"
end

post "/users/new" do
  user = User.create(:name=>params[:user][:name])
  session[:user_id] = user.id
  redirect "/users/#{user.id}/albums"
end

get "/users/:id/albums" do
  authenticate!
  @photos = User.find(params[:id]).albums
  @base_url = "/users/#{params[:id]}/albums"

  erb :"photo/index"
end

get "/users/:user_id/albums/:album_id" do
  authenticate!
  user = User.find(params[:user_id])
  album = user.albums.find(params[:album_id])
  @photos = album.photos.all
  @base_url = "/photos"

  erb :"photo/index"
end

def authenticate!
  redirect to('/users/login') unless logged_in?
end