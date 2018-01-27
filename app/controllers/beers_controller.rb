class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :update, :destroy]

  def index
    @beers = Beer.all
  end

  def show
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:name, :price)
    end
end
