class DashboardController < ApplicationController
  def index
    @employees = Employee.all
  end

  def search
    render nothing: true
  end
end
