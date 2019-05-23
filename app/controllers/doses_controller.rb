class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail])
    @dose = Dose.new(dose_params)
  end

  def create
    @dose.cocktail = @cocktail
      if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
