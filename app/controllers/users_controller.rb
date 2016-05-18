class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to invitations_path, notice: 'Se actualizaron tus datos'
    else
      render :edit, notice: 'No se pudieron actualizar tus datos'
    end
  end

  def invitations
    @invitations = current_user.invitations.where(status: 0)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :shirt_size)
  end
end
