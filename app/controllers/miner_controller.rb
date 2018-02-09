class MinerController < ApplicationController
  def start
    load "#{Rails.root}/lib/geth.rb"
    render(Geth.miner_start(params[:cpu] || 1))
  end
  def stop
    load "#{Rails.root}/lib/geth.rb"
    render(Geth.miner_stop)
  end
end
