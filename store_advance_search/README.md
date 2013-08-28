This is the app demo ADVANCE SEARCH
- SEARCH BUILD ON MODEL AND CONTROLLER
++++
  rails g model search keywords:string category_id:integer min_price:decimal max_price:decimal
  rake db:migrate
  rails g controller searches
++++

-SearchesController-
  def new
    @search = Search.new
  end
  
  def create
    @search = Search.create!(params[:search])
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
  end
--------------
Search model
 
  def products
    @products ||= find_products
  end
  
private

  def find_products
    products = Product.order(:name)
    products = products.where("name like ?", "%#{keywords}%") if keywords.present?
    products = products.where(category_id: category_id) if category_id.present?
    products = products.where("price >= ?", min_price) if min_price.present?
    products = products.where("price <= ?", max_price) if max_price.present?
    products
  end

--------