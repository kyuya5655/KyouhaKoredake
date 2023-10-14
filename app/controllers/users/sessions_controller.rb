# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    today_path
  end

  def after_sign_out_path_for(resouce)
    new_user_session_path
  end

  def user_state
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted==true)
        redirect_to new_user_registration_path
      end
    end
  end

end
