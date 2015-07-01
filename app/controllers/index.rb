get '/' do
  # Look in app/views/index.erb
  redirect to "/users"
end

get '/users' do
  @user = User.all
  erb :index
end

get '/create' do
  erb :new_account
end

get '/log_in' do
  erb :log_in
end

get '/log_out' do
  session['user_id'] = nil
  erb :log_in
end

get '/error' do
  erb :error
end

get '/forget_password' do
  erb :error
end

get '/profile/:id' do
  @user_id = params[:id]
  @user = User.find_by_id(@user_id)
  @posts = @user.posts.all.order('id desc')
  erb :profile
end

post '/create' do
  @user = User.create(params[:user])
  if @user.save
    redirect to "/profile/#{@user.id}"
  else
    @user = User.create
    @error = "Email has been used"
    erb :new_account
  end
end

post '/new_session' do
  if @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session['user_id'] = @user.id
      redirect to "/profile/#{@user.id}"
    else
      redirect to '/error'
    end
    else
    redirect to '/error'
  end
end

