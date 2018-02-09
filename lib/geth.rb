module Geth
  def self.method_missing mth, *args, **opts
    require 'json'
    require 'net/http'
    uri = URI('http://localhost:8545')
    res = Net::HTTP.start(uri.hostname, uri.port){|http|
      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      req.body = {
        jsonrpc: '2.0',
        id: rand(0x100000),
        method: mth,
        params: args
      }.to_json
      http.request(req)
    }
    res = JSON.parse(res.body)
    if res['error']
      {
        json: {error: res['error']['message']},
        status: 400
      }
    elsif res.size == 0 || res['result'] == nil
      {
        json: {error: 'result not found'},
        status: 404
      }
    else
      {
        json: res['result'],
        status: 200
      }
    end
  rescue StandardError
    {
      json: {error: 'internal error'},
      status: 500
    }
  end
end

