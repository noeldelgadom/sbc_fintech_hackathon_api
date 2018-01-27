class TransfersController < ApplicationController
  def create
    body = JSON.parse(request.body.read)

    from_account  = User.find(body['from_id']).account_number     if body['from_model'] == 'User'
    from_account  = Company.find(body['from_id']).account_number  if body['from_model'] == 'Company'
    to_account    = User.find(body['to_id']).account_number       if body['to_model'] == 'User'
    to_account    = Company.find(body['to_id']).account_number    if body['to_model'] == 'Company'

    FiinlabTool.transfer(from_account, to_account, body['ammount'], body['reference'])
  end
end
