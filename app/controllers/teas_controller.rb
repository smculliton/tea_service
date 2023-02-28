class TeasController < ApplicationController
  def index
    teas = Tea.all

    render json: TeaSerializer.new(teas), status: 200 
  end
end