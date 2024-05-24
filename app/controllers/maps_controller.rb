class MapsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def map_params
    params.require(:post).permit(:address,:latitude,:longitude)
  end
end
