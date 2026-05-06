class BookingPaymentProcessor < PaymentProcessor
  def initialize(method:, params: {})
    super
  end

  private

  def process_pix
    finalize_payment(super)
  end

  def process_credit_card
    finalize_payment(super)
  end

  def finalize_payment(payment_method)
    booking = @params[:booking]
    total_being_paid = @params[:total_being_paid]

    Payment.create!(
      amount: total_being_paid,
      payment_method: payment_method,
      booking:,
      status: :paid
    )

    booking.update_payment_situation(total_being_paid, booking)
  end

end
