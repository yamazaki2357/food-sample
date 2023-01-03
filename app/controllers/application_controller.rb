# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception
  before_action :set_search_query

  private

  def set_product_categories
    @product_categories = ProductCategory.all.map { |n| [n.classification_name, n.id] }
  end

  def set_filter_product_categories
    # よく使う食材分類だけ指定して表示
    @filter_product_categories = ProductCategory.find(23, 22, 24, 5, 7, 4, 3, 6, 8, 9, 12, 14, 15, 26, 28).map { |n| [n.classification_name, n.id] }
  end

  def set_cooking_categories
    @cooking_categories = CookingCategory.all.map { |n| [n.classification_name, n.id] }
  end

  def set_all_cooking_categories
    @all_cooking_categories = CookingCategory.all
  end

  def set_search_query
    @q = current_user.products.ransack(params[:q]) if session[:user_id]
    @products = @q.result(products_number: true) if session[:user_id]
  end

  def set_cookings
    @cookings = Cooking.all
  end

  def set_products
    @products = Product.all
  end

  def set_user
    @user = current_user
  end

  def correct_user
    @correct_user = User.find(params[:id])
    # @correct_user != current_user && !current_user.admin? if redirect_to root_path, notice: t('msg.Do_not_access_posts_list')TODO:編集のためコメントアウト。要修正
  end
end
