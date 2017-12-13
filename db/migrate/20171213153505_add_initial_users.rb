class AddInitialUsers < ActiveRecord::Migration
  def change
    user_1 = User.create(email: "fake@email.com", password: "alongfakepassword")
    user_2 = User.create(email: "amorefakeemail@email.com", password: "alongerfakepassword")
    user_1.carts << Cart.find_by(id: 5)
    user_1.carts << Cart.find_by(id: 4)
    user_2.carts << Cart.find_by(id: 3)
    user_2.carts << Cart.find_by(id: 2)
  end
end
