class ProductsController < ApplicationController
    def index
      system "rake reseed"
         @products = Product.all
        @order_item = current_order.order_items.new
        if Temperature.last.temp < 280
          @products = Product.where(:weather_type => 'Cold')
          render :index, layout: 'cold'
          @home_page_cold = true
        else
          @products = Product.where(:weather_type => 'Warm')
          @home_page_warm = true
        end
      end

      def new
        @product = Product.new
      end
    
      def show
        @product = Product.find(params[:id])
      end
    
      def create
        @product = Product.new
        @product.name = params[:product][:name]
        @product.price = params[:product][:price]
        @product.weather_type = params[:product][:weather_type]
        @product.image_name = params[:product][:image_name]
        @product.save
        redirect_to product_path(@product)
      end
    
      def edit
        @product = Product.find(params[:id])
      end
    
      def update
        product = Product.find(params[:id])
        product.update(name: params[:product][:name], price: params[:product][:price])
        redirect_to "/product/#{product.id}"
      end
    
end
