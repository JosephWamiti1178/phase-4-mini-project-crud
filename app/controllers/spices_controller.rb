class SpicesController < ApplicationController
    before_action :set_spice, only: [:update, :destroy]
  
    # GET /spices
    def index
      spices = Spice.all
      render json: spices
    end
  
    # POST /spices
    def create
      spice = Spice.new(spice_params)
      if spice.save
        render json: spice, status: :created
      else
        render json: { error: "Spice could not be created" }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /spices/:id
    def update
      if @spice.update(spice_params)
        render json: @spice
      else
        render json: { error: "Spice could not be updated" }, status: :unprocessable_entity
      end
    end
  
    # DELETE /spices/:id
    def destroy
      @spice.destroy
      render json: { message: "Spice deleted" }, status: :ok
    end
  
    private
  
    def set_spice
      @spice = Spice.find(params[:id])
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
  end
  