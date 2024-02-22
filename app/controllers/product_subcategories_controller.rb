class ProductSubcategoriesController < ApplicationController
  before_action :set_product_subcategory, only: %i[ show edit update destroy ]

  # GET /product_subcategories or /product_subcategories.json
  def index
    if params[:search].present?
      @product_subcategories = ProductSubcategory.search(params[:search]).order(name: :asc).paginate(page: params[:page], per_page: 5)
    else
      @product_subcategories = ProductSubcategory.all.order(name: :asc).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /product_subcategories/1 or /product_subcategories/1.json
  def show
  end

  # GET /product_subcategories/new
  def new
    @product_subcategory = ProductSubcategory.new
  end

  # GET /product_subcategories/1/edit
  def edit
  end

  # POST /product_subcategories or /product_subcategories.json
  def create
    @product_subcategory = ProductSubcategory.new(product_subcategory_params)

    respond_to do |format|
      if @product_subcategory.save
        format.html { redirect_to product_subcategories_path, notice: "Product subcategory was successfully created." }
        format.json { render :show, status: :created, location: @product_subcategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_subcategories/1 or /product_subcategories/1.json
  def update
    respond_to do |format|
      if @product_subcategory.update(product_subcategory_params)
        format.html { redirect_to product_subcategory_url(@product_subcategory), notice: "Product subcategory was successfully updated." }
        format.json { render :show, status: :ok, location: @product_subcategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_subcategories/1 or /product_subcategories/1.json
  def destroy
    @product_subcategory.destroy!

    respond_to do |format|
      format.html { redirect_to product_subcategories_url, notice: "Product subcategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_subcategory
      @product_subcategory = ProductSubcategory.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_subcategory_params
      params.require(:product_subcategory).permit(:name, :description, :product_category_id)
    end
end
