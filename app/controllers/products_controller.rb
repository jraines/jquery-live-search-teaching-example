class ProductsController < ApplicationController
  def index
    @products = Product.all
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
