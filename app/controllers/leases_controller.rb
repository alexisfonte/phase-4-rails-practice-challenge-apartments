class LeasesController < ApplicationController

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent)
    end

    def find_lease
        Lease.find(params[:id])
    end

end