class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :create_new_form, only: [:new, :create]
  before_action :create_edit_form, only: [:edit, :update]
  def show
  end

  def new
  end

  def create
    @category_form.submit(category_params)

    if @category_form.save
      flash[:success] = "Category created successfully."
      redirect_to @category_form
    else
      flash[:alert] = "Invalid submission."
      render :new
    end
  end

  def edit
  end

  def update
    @category_form.submit(category_params)
    if @category_form.save
      flash[:success] = "Category updated!"
      redirect_to @category_form
    else
      flash[:alert] = "Invalid submission."
      render :edit
    end
  end


  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name, :abbreviation, subcategories_attributes: [:id, :name, :rank, :_destroy, exercises_attributes: [:id, :name, :nickname, :_destroy]])
  end

  def create_new_form
    category = Category.new
    @category_form = CategoryForm.new(category)
  end

  def create_edit_form
    @category_form = CategoryForm.new(@category)
  end
end