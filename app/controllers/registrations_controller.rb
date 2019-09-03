# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    yield resource if block_given?
    if @user.secret_code == "foobar"
      @user.save
      respond_to do |format|
        format.html do
          redirect_to new_user_session_path
        end
      end
    else
      render 'new'
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :current_password,
                                 :password_confirmation, :secret_code)
  end
end
