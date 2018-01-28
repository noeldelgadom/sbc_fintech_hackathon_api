json.balances do
  json.actual      balance['data']['message'][0]['Amount']['_']
  json.available   balance['data']['message'][1]['Amount']['_']
  json.pending     balance['data']['message'][2]['Amount']['_']
end
