# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_cookings, only: %i[new create edit update]
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product_categories, only: %i[new create edit update]
  before_action :set_filter_product_categories, only: %i[new create edit update]
  before_action :set_cooking_categories, only: %i[new create edit update]
  before_action :authenticate_user!, only: %i[new create edit update]
  # CSRFトークン検証をスキップする
  skip_before_action :verify_authenticity_token
  PAGE_LIMIT_NUMBER = 30
  PER = 24

  def index
    @products_page = Product.order(updated_at: 'DESC').page(params[:page]).per(PER)
  end

  def show
  end

  def new
    if current_user.admin?
      @product = Product.new
      @product.cooking_product_relations.build
    else
      redirect_to root_path, notice: t('msg.Do_not_edit_product')
    end
  end

  def edit
    !current_user.admin? if redirect_to root_path, notice: t('msg.Do_not_edit_product')
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to products_path, notice: t('msg.create', name: t('product', name: @product.product_name))
    else
      render :new
    end
  end

  def update
    @product.update!(product_params)
    redirect_to products_url, notice: t('msg.update', name: t('product', name: @product.product_name))
  rescue ActiveRecord::RecordInvalid
    render :edit
  rescue StandardError
    @product.errors.add(:base, t('msg.error_information', name: @product.product_name))
    render :edit
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: t('msg.delete', name: t('product', name: @product.product_name))
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_number, :page, :discontinued, :unit_name, :price, :remark, :unit, :image, :user_id, :created_at, :updated_at, :product_category_id,
                                    :cooking_category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
