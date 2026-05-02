class CardInformationsController < ApplicationController
  def index
    @card_information = current_user.card_informations.active
  end

  def new
    @card_information = current_user.card_informations.build
  end

  def create
    @card_information = current_user.card_informations.build(card_information_params)

    if @card_information.save
      redirect_to profile_path, notice: "New Card Added!"
    else
      flash.now[:error] = "There were errors while saving your new card."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @card_information = current_user.card_informations.find(params[:id])

    if @card_information.update(active: false)
      redirect_to profile_path, notice: "Card successfully deleted."
    else
      redirect_to profile_path, alert: "We could not remove that card right now."
    end
  end

  private

  def card_information_params
    params.expect(card_information: [
      :owner_full_name,
      :number,
      :owner_document,
      :_destroy
    ])
  end
end
