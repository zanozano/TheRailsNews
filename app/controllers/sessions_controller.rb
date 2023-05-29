class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def create
    username = params[:username]
    password = params[:password]
    
    # Verificar si el usuario existe en la base de datos
    user = User.find_by(username: username)
    
    if user && user.authenticate(password)
      # Iniciar sesión exitosamente
      # Puedes redirigir a otra página o realizar cualquier acción adicional aquí
      redirect_to root_path, notice: "Inicio de sesión exitoso"
    else
      # El usuario no existe o la contraseña es incorrecta
      flash.now[:alert] = "Usuario o contraseña incorrectos"
      render :new
    end
  end
end

