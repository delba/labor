class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    @search = Geocoder.search(params[:search]).first

    if @search
      @employees = Employee.near(@search.coordinates)
      @bounds = Locator.get_bounds(@employees, limit: 3)
    end
  end
end
