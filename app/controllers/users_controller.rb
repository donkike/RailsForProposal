class UsersController < ApplicationController
  before_filter :logged_in?
  before_filter :is_admin?, :only => [:index, :new, :create, :destroy]
  before_filter :is_current_user?, :only => [:show, :edit]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => "Usuario creado exitosamente."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Datos actualizados exitosamente."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Usuario eliminado exitosamente."
  end
  
  private
  def is_current_user?
    redirect_to(root_url, :notice => "No esta autoraizado para ver este recurso") unless current_user == User.find(params[:id])
  end
end
