class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end
    
    def show
        apt = find_apartment
        render json: apt
    end
    
    def create
        apt = Apartment.create!(apt_params)
        render json: apt, status: :created
    end
    
    def update
        apt = find_apartment
        apt.update!(apt_params)
        render json: apt, status: :accepted
    end
    
    def destroy
        apt = find_apartment
        apt.destroy
        head :no_content
    end

    private

    def find_apartment
        Apartment.find(params[:id])
    end

    def apt_params
        params.permit(:number)
    end
end
