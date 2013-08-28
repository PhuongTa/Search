class Product < ActiveRecord::Base
  attr_accessible :category_id, :name,:price
  belongs_to :category 
  def self.search(search)
  	if search
  		find(:all,:conditions => ['name LIKE ?', "%#{search}%"])
  	else
  		find(:all)
  	end
  end
end
