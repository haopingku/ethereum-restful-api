require 'geth'

class NodeController < ApplicationController
  def index
    load "#{Rails.root}/lib/geth.rb"
    render(Geth.admin_nodeInfo)
  end
end

