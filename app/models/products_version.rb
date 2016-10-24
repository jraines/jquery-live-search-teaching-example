class ProductsVersion < ActiveRecord::Base
  belongs_to :product
  belongs_to :version
end
