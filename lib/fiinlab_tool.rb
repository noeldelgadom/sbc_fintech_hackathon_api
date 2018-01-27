module FiinlabTool
  require 'rest-client'
  require 'json'

  def self.retrieve_data(url)
    response  = RestClient.get URI::encode(url)
    JSON.parse(response.body).with_indifferent_access
  end
end
