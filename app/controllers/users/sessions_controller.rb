# frozen_string_literal: true

# Users
class Users::SessionsController < Devise::SessionsController
  def edit
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
