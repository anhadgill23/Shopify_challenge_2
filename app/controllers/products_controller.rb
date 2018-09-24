class ProductsController < ApplicationController
  before_action :load_shop

  # GET /products
  # GET /products.json
  def index
    @products = @shop.products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = @shop.products.find(params[:id])
  end

  # GET /products/new
  def new
    @product = @shop.products.new
  end

  # GET /products/1/edit
  def edit
    @product = @shop.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @shop.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [@shop, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: [@shop, @product] }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

    @product = @shop.products.find(params[:id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [@shop, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy

    @product = @shop.products.find(params[:id])
    
    @product.destroy
    respond_to do |format|
      format.html { redirect_to shop_products_path(@shop), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_item
    @product = @shop.products.find(params[:id]).to_s

    @line_item = 
    item = cart[product_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[product_id] = item

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = @shop.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :unit_price, :category, :total_in_stock)
    end

    def load_shop
      @shop = Shop.find(params[:shop_id])
    end
end
