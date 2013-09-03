class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    @result = Geocoder.search(params[:search]).first

    if @result
      @employees = Employee.near(@result.coordinates)
    else
      head :no_content
    end
  end
end
