class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    @search = Geocoder.search(params[:search]).first

    if @search
      @employees = Employee.near(@search.coordinates)
    end
  end
end
