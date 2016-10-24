class SpecialsController < ApplicationController
  def index
    @specials = Special.all
  end

  def show
    @special = Special.find params[:id]
  end

end
