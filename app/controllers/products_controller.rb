class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    cloned_attrs = @product.attributes
    cloned_attrs.delete("id")

    @cloned_product = Product.create cloned_attrs
    @cloned_product.update product_params

    #cheating a bit here. In your app you will be editing
    #a product (scenario) in the context of a special (sheet)
    #so that specific sheet would need to be passed in and
    #initialized here
    special = @product.specials.first

    #create a new version for each special that product belongs to
    new_version = special.versions.create

    #cheating here too.  This would either be the most recent
    #version, or the specific version being used when the
    #scenario was "edited"
    v = special.versions.first
    new_version.products << (v.products - [@product])
    new_version.products << @cloned_product

    redirect_to specials_path
  end

  def product_params
    params.require(:product).permit(:name)
  end

  def search
    #surrounding the query with percent signs so when we use it
    #in a "LIKE" query the database will match the query regardless
    #of where it appears in the text value of the given field
    formatted_query = "%#{params[:query]}%"

    if params[:query].to_i != 0
      @products = Product.where(id: params[:query])
    else
      @products = Product.where("name like ? or description like ?", formatted_query, formatted_query)
    end

    render json: @products
  end
end
