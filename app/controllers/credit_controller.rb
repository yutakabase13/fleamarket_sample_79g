class CreditController < ApplicationController
  def pay
    Payjp.api_key = "sk_test_d51186afdfe6ca64ffe09a80"
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
    card = current_user.credit_card
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = "sk_test_d51186afdfe6ca64ffe09a80"
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
      Payjp.api_key = "sk_test_d51186afdfe6ca64ffe09a80"
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
    card =　current_user.credit_card
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.ap_key = 'sk_test_d51186afdfe6ca64ffe09a80'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
    end
  end
end