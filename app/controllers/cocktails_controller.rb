class CocktailsController < ApplicationController
 before_action :set_cocktail, only: [:destroy]

  # GET /cocktail
  def index
    @cocktails = Cocktail.all
     if params[:query].present?
      sql_query = "name ILIKE :query OR ingredientes ILIKE :query"
      @drinks = Drink.where(sql_query, query: "%#{params[:query]}%")
    end
  end



  def show
  end

  def new
    @cocktail = Cocktail.new

  end

  # GET /cocktail/1/edit


  # POST /cocktail
  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'cocktail was successfully created.'
    else
      render :new
    end
  end

  # DELETE /cocktail/1
  def destroy
    if @cocktail.destroy
      redirect_to root_path, notice: 'cocktail was successfully destroyed.'
    else
      render @cocktail
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
    # Only allow a trusted parameter "white list" through.
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end


