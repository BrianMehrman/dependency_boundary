class BicyclesController < ApplicationController
  def index
    render json: Bicycle.all.to_json
  end

  def show
    render json: Bicycle.find(params[:id]).to_json
  end

  def create
  end

  def update
  end

  def destroy
  end
end
