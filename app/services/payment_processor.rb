class PaymentProcessor
  def initialize(method:, params: {})
    @method = method
    @params = params
  end

  def call
    send("process_#{@method}")
  end

  private

  def process_pix_payment
    PixPayment.create!(
      issuing_bank: "Fake bank",
      transaction_id: "fake_id",
      pix_key: "fake_key",
      payload: "random_payload_here",
      expires_at: 15.minutes.from_now
    )
  end

  def process_card_payment
    CardPayment.create!(card_information_id: @params[:card_information_id])
  end
end
