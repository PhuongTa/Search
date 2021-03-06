class CategoriesController < ApplicationController
  def new
  	@category =Category.new
  end
  def show
    @category = Category.find(params[:id])
  end
  def create
  	@category = Category.create(params[:category])
  	if @category.save
  		flash[:notice]="Successfully created category."
      redirect_to new_category_path
  	else
  		render 'new'
  	end
  end

  def edit
    @category =Category.find(params[:id])  
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] ="Successfully updated category."
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(paramsp[:id])
    @category.destroy
    flash[:notice]="Successfully destroyed category."
    redirect_to categories_url
  end
  def index
    @categories = Category.all
  end
end
