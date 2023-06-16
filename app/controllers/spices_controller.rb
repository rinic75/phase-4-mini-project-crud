class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    spices = Spice.all
    render json: spices, status: :ok
  end

  def show
    spice = find_spice
    render json: spice, status: :ok
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice, status: :ok
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_spice
    Spice.find(params[:id])
  end
  
end
