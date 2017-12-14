class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :carts
  has_one :current_cart, class_name: "Cart", foreign_key: "user_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def find_or_create_current_cart
     self.current_cart ||= Cart.create(user_id: self.id)
   end

end
