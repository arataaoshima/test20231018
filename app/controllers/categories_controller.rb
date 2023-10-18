class CategoriesController < ApplicationController

    before_action :find_category, only: [:edit, :update, :destroy]
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "You have successfully created a category"
            redirect_to categories_path
        else
            render 'new'
        end
    end

    def index
        @categories = Category.all
    end

    def edit
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "You have succuessfully upated the category"
            redirect_to categories_path
        else
            render 'edit'
        end
    end

    def destroy
    end

    def category_params
        params.require(:category).permit(:category_name)
    end

    def find_category
        @category = Category.find_by(id: params[:id])
    end
end