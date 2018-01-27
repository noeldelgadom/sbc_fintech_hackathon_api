json.transactions do
  json.array! statement['data']['statement_result'], partial: 'fiinlab/transaction', as: :transaction
end
