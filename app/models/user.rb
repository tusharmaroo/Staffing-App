class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_new_user(email)
    user = User.new({ :email => email, :password => "Password@123" })
    return user.save
  end
end
