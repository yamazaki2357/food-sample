# frozen_string_literal: true

# home controller
class HomesController < ApplicationController
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_user, only: %i[index]

  def index
    @cooking_category_various = Cooking.where(cooking_name: %w[ベリーワッフル 天ぷらそば定食 ハンバーガー エビチリ天津飯定食]).order(:updated_at)
    # @cooking_category_various = []
    # TODO: トップページに名称指定で掲載していたもの
  end
end
