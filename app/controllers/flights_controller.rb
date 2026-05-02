class FlightsController < ApplicationController
  def index
    @flights = nil

    return unless filtering_params.present?

    @flights = Flight.upcoming.includes(route: [ :departure_airport, :arrival_airport ])

    @flights = @flights.with_departure_airport(params[:departure_airport_id]) if params[:departure_airport_id].present?
    @flights = @flights.with_arrival_airport(params[:arrival_airport_id]) if params[:arrival_airport_id].present?

    if params[:departure_date].present?
      date = Date.parse(params[:departure_date])
      @flights = @flights.with_exact_departure_date(date)
    end
  end

  private

  def filtering_params
    params.permit(
      :departure_airport_id,
      :arrival_airport_id,
      :departure_date
    ).select { |_, value| value.present? }
  end
end
