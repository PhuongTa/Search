class Product < ActiveRecord::Base
  attr_accessible :category_id, :name,:price
  belongs_to :category 

  private
  def self.search(keywords)
  	products = order(:name)
    products = products.where("name LIKE ?", "%#{keywords}%") if keywords.present?
    products
  end
end
