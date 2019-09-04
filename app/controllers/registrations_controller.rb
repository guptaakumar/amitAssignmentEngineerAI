# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    build_resource(sign_up_params.merge(role: User.roles[:user]))
    yield resource if block_given?
    @secret_code = SecretCode.find_by(code: params[:secret_key])
    if @secret_code.present?
      if @user.save
        @secret_code.update(user: @user)
        respond_to do |format|
          format.html do
            redirect_to new_user_session_path
          end
        end
      end
    else
      flash[:alert] = resource.errors.full_messages.to_sentence
      render 'new'
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :current_password,
                                 :password_confirmation, :secret_key, :role)
  end
end
