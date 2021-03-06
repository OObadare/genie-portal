class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  # protect_from_forgery prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :username, :bylaw_agreement)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:id, :email, :password, :username, :first_name, :last_name, :zipcode)
    end
  end

  # private
  #
  # # Overwriting the sign_out redirect path method
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  #   # root to: "static_pages#root"
  # end

end
