class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path, notice: 'Se actualizaron tus datos'
    else
      render :edit, notice: 'No se pudieron actualizar tus datos'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :shirt_size, :avatar)
  end
end
