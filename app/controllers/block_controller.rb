class BlockController < ApplicationController
  def index
    render(json: {error: 'usage: /block/<block_hash>'})
  end
  def view 
    load "#{Rails.root}/lib/geth.rb"
    render(Geth.eth_getBlockByHash(params[:id], true))
  end
end
