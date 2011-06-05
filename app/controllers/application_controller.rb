class ApplicationController < ActionController::Base
  protect_from_forgery
  
  filter_parameter_logging :password

  helper_method :current_user
  
  protected 
  
  def logged_in?    
    redirect_to(login_path, :notice => "Debe iniciar sesion") unless current_user
  end
  
  def is_admin?
    redirect_to(root_url, :notice => "No esta autorizado para ver este recurso") unless current_user.admin
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
end
