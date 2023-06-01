# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
  def create
  self.resource = warden.authenticate(auth_options)
  if resource.nil?
    flash.now[:alert] = "Credenciales inválidas. Por favor, verifica tu correo electrónico y contraseña."
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('login-form', partial: '/devise/shared/alert', locals: { message: flash.now[:alert] }) }
      format.html { render :new }
    end
  else
    super
  end
  end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
