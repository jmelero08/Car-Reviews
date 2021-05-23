class VehiclesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        @vehicle = Vehicle.new
        @vehicle.build_type
    end

    def create
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.user_id = session[:user_id]

        if @vehicle.save
            redirect_to vehicle_path(@vehicle)
        else
            render :new
        end
    end

    def index
        @vehicles = Vehicle.order_by_rating
    end

    def show
        @vehicle = Vehicle.find_by_id(params[:id]) 
    end


    def edit
        @vehicle = Vehicle.find_by_id(params[:id]) 
    end

    def update
        @vehicle = Vehicle.find_by_id(params[:id]) 
        if @vehicle.update(vehicle_params)
            redirect_to vehicle_path(@vehicle)
        else 
            render :edit
        end
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:name, :year, :type_id, type_attributes: [:name])
    end
end
