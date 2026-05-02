class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to flights_path, notice: "User information updated."
    else
      flash.now[:error] = "There were errors while saving this profile."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :name,
      :date_of_birth
    )
  end
end
