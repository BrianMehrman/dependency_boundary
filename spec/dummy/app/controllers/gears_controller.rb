class GearsController < ApplicationController
  def index
    render json: Gear.all.to_json
  end

  def show
    render json: Gear.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
