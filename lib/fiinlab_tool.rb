module FiinlabTool
  require 'rest-client'
  require 'json'

  def self.create_session
    response = RestClient.post '217.32.246.192:9091/ESBConnector/createSession',
      {
        "organizationID": "COMPARTAMOS",
        "channel": "WEBSERVICE",
        "application": "CMPXA003",
        "username": "TCPIP"
      }.to_json, :content_type => 'application/json'
    JSON.parse(response.body).with_indifferent_access
  end

  def self.login
    session = FiinlabTool.create_session
    if session['token']
      response = RestClient.post '217.32.246.192:9091/ESBConnector/service',
        {
          "username": "TCPIP",
          "password": "12345678",
          "action": "LOGIN"
        }.to_json,
        :x_access_token => session['token'],
        :content_type => 'application/json'
      login_response = JSON.parse(response.body).with_indifferent_access
      login_response['data'] ? session : login_response
    else
      session['messge']
    end
  end

  def self.account_balance
    session = FiinlabTool.login
    if session['token']
      response = RestClient.post '217.32.246.192:9091/ESBConnector/esb/core/transaction',
        {
          "trans_type": "BENQ0002",
          "account": "01",
          "custaccount": "113183314"
        }.to_json,
        :x_access_token => session['token'],
        :content_type => 'application/json'
      balance_response = JSON.parse(response.body).with_indifferent_access
    else
      session['messge']
    end
  end

  def self.account_statement
    session = FiinlabTool.login
    if session['token']
      response = RestClient.post '217.32.246.192:9091/ESBConnector/esb/core/transaction',
        {
          "trans_type": "STMNT0002",
          "account": "01",
          "custaccount": "113183314"
        }.to_json,
        :x_access_token => session['token'],
        :content_type => 'application/json'
      statement_response = JSON.parse(response.body).with_indifferent_access
    else
      session['messge']
    end
  end

  def self.transfer(from_account, to_account, amount, reference)
    session = FiinlabTool.login
    if session['token']
      response = RestClient.post '217.32.246.192:9091/ESBConnector/esb/core/transaction',
        {
          "trans_type": "INTTFR0002",
          "account": "00",
          "fromaccountnumber": from_account,
          "toaccountnumber": to_account,
          "amount": amount,
          "reference": reference
        }.to_json,
        :x_access_token => session['token'],
        :content_type => 'application/json'
      transfer_response = JSON.parse(response.body).with_indifferent_access
    else
      session['messge']
    end
  end
end
