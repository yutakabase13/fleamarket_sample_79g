class CreditController < ApplicationController
  before_action :set_card, only:[:show, :delete]

  def pay
    Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjpToken'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end  

  def new
  end
  
  def show
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end
    
  def buy
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @product = Product.find(params[:product_id])
      card = current_user.credit_card
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        current: 'jpy',
      )
      if @product.update(status: 1, buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: "products", action: 'show'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "products", action: 'show'
      end
    end
  end
      
  def delete
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.ap_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
    end
  end
  
  private

  def set_card
    root to 'credit#new'
    resources only, set_card: [:show, :delete]
  end
end