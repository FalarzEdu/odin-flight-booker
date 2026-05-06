class PaymentProcessor
  def initialize(method:, params: {})
    @method = method
    @params = params
  end

  def call
    case @method
    when "pix_payment"
      process_pix
    when "card_payment"
      process_credit_card
    else
      raise "Unknown payment method"
    end
  end

  private

  def process_pix
    PixPayment.create!(
      issuing_bank: "Fake bank",
      transaction_id: "fake_id",
      pix_key: "fake_key",
      payload: "random_payload_here",
      expires_at: 15.minutes.from_now
    )
  end

  def process_credit_card
    card_id = @params[:card_information_id]
    CardPayment.create!(card_information_id: card_id)
  end
end
