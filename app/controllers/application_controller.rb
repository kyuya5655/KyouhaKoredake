class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #sign_in
  def after_sign_in_path_for(resource)
    today_path
  end

  #sign_up
  def after_sign_up_path_for(resource)
    today_path
  end

  #sign_out
  def after_sign_out_path_for(resouce)
    new_user_session_path
  end

  def user_state
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_passward?(params[:user][password]) && (@user.is_deleted==true)
        redirect_to new_user_registration_path
      end
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted])
  end

end
