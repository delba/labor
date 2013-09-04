class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    @employees = Employee.near(params[:search])
  end
end
