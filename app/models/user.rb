class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  def self.authenticate(email, password)

    @user = User.find_by_email(params[:email])
    unless @user.nil?
      if @user.password == password
          return @user
        else
          return nil
      end
        else
      return nil
    end
  end


  def destroy
    Post.destroy(params[:id])
  end


private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

