class BeersController < ApplicationController

  # store_beers GET    /stores/:store_id/beers(.:format)          beers#index
  def index
    @beers = Beer.all
  end

  #                 POST   /stores/:store_id/beers(.:format)          beers#create
  def create
    store = Store.find(params[:store_id])
    beer = Beer.create(beer_params)
    store.beers << beer
    redirect_to "/stores/#{store.id}/beers/#{beer.id}"
  end

  # new_store_beer GET    /stores/:store_id/beers/new(.:format)      beers#new
  def new
    @store = Store.find(params[:store_id])
  end

  # edit_store_beer GET    /stores/:store_id/beers/:id/edit(.:format) beers#edit
  def edit
    @store = Store.find(params[:store_id])
    @beer = Beer.find(params[:id])
  end
  #      store_beer GET    /stores/:store_id/beers/:id(.:format)      beers#show
  def show
    @beer = Beer.find(params[:id])
  end
  #                 PATCH  /stores/:store_id/beers/:id(.:format)      beers#update

  #                 PUT    /stores/:store_id/beers/:id(.:format)      beers#update
  def update
    store = Store.find(params[:store_id])
    beer = Beer.find(params[:id])
    beer.update(beer_params)
    redirect_to "/stores/#{store.id}/beers/#{beer.id}"
  end
  #                 DELETE /stores/:store_id/beers/:id(.:format)      beers#destroy
  def destroy
    store = Store.find(params[:store_id])
    Beer.delete(params[:id])
    redirect_to "/stores/#{store.id}/beers/#{beer.id}"
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :type, :size, :price)
  end

end
