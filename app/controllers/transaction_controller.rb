class TransactionController < ApplicationController
  def index
    render(json: {error: 'usage: /transaction/<transaction_hash>'})
  end
  def view 
    load "#{Rails.root}/lib/geth.rb"
    render(Geth.eth_getTransactionByHash(params[:id]))
  end
end
