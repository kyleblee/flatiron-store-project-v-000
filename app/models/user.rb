class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :carts
  belongs_to :current_cart, class_name: "Cart"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def find_or_create_current_cart
     self.current_cart ||= Cart.create
     self.save
     self.current_cart
   end

end
