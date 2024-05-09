class MapsController < ApplicationController
  def index
  end

  def map_params
    params.require(:post).permit(:address,:latitude,:longitude)
  end
end
