class TransfersController < ApplicationController
  def create
    @body = JSON.parse(request.body.read)
    puts @body
  end
end
