class Product < ActiveRecord::Base
  has_many :products_versions
  has_many :versions, through: :products_versions
  has_many :specials, through: :versions
end
