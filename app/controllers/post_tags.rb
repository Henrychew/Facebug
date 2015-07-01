post '/new_status' do
  @user = User.find(session['user_id'])
  @post = @user.posts.find_or_create_by(params[:post])
  @tag = @post.tags.find_or_create_by(params[:tag])
  if @post.save
    redirect to "/profile/#{@user.id}"
  end
end


# get '/update/:post_id/tag' do
#   @user = User.find(session['user_id'])
#   @post = @user.posts.find(params[:post_id])
#   @tag = @post.tags.find(params[:tag_id])
#   redirect to "/profile/#{@user.id}"
# end

post '/update/:post_id' do
  @user = User.find(session['user_id'])
  @post = @user.posts.find(params[:post_id])
  # @tag = @post.tags.find(params[:tag_id])
  if @post.update(params['post'])
      redirect to "/profile/#{@user.id}"
    # if @tag.update(params['tag'])
    #   redirect to "/profile/#{@user.id}"
      else
      redirect to "/profile/#{@user.id}"
  end
end


get '/post/:post_id/edit' do
  @post = Post.find(params[:post_id])
  erb :edit
end

delete '/post/:post_id' do
  @user = User.find(session['user_id'])
  @post = Post.find params[:post_id]
  @post.destroy
  redirect to "/profile/#{@user.id}"
end

