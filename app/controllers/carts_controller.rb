class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    if Temperature.last.temp < 280
      render :show, layout: 'cold'
      @home_page_cold = true
    else
      @home_page_warm = true
    end
  end
  
end
