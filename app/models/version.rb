class Version < ActiveRecord::Base
  belongs_to :special
  has_many :products_versions
  has_many :products, through: :products_versions
end
