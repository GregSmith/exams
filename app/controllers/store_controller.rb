class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
  end
  
  def confirmuser
    greg = User.find(1)
    greg.confirm!
    otheruser = User.last
    otheruser.confirm!
    
  end

end
