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
    response = RestClient.post '217.32.246.192:9091/ESBConnector/service',
      {
        "username": "TCPIP",
        "password": "12345678",
        "action": "LOGIN"
      }.to_json,
      :x_access_token => 'eyJhbGciOiJIUzI1NiJ9.NWE2Y2FiOGRlMjFkYzIwOGViMWMwNzdl.az3GyxAKhObJ0hTMjJbJO0SdMUF0suwz3VBL0VHYXKw',
      :content_type => 'application/json'
    JSON.parse(response.body).with_indifferent_access
  end
end
