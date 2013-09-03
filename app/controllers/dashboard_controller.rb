class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    @result = Geocoder.search(params[:search]).first
    head :no_content unless @result
  end
end
