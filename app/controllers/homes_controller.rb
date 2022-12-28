# frozen_string_literal: true

# home controller
class HomesController < ApplicationController
  before_action :set_all_cooking_categories, only: %i[index show]
  before_action :set_user, only: %i[index]

  def index
    @cooking_category_various = Cooking.where(cooking_name: %w[天ぷらそば定食 シチュー エビチリ天津飯セット ベリーワッフル])
  end
end
