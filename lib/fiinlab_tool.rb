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
      return login_response['data'] ? login_response['data'] : login_response['message']
    else
      return session['messge']
    end
  end
end
