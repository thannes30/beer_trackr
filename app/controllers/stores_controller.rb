class StoresController < ApplicationController

  # stores GET    /stores(.:format)                          stores#index
  def index
    @stores = Store.all
  end

  #            POST   /stores(.:format)                          stores#create
  def create
    store = Store.create(store_params)
    redirect_to "/stores/#{store.id}"
  end

  #  new_store GET    /stores/new(.:format)                      stores#new
  def new
  end

  # edit_store GET    /stores/:id/edit(.:format)                 stores#edit
  def edit
    @store = Store.find(params[:id])
  end

  #      store GET    /stores/:id(.:format)                      stores#show
  def show
    @store = Store.find(params[:id])
  end

  #            PATCH  /stores/:id(.:format)                      stores#update

  #            PUT    /stores/:id(.:format)                      stores#update
   def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to "/stores/#{store.id}"
  end

  #            DELETE /stores/:id(.:format)                      stores#destroy
  def destroy
    Store.delete(params[:id])
    redirect_to "/stores"
  end

  private
  def store_params
    params.require(:store).permit(:name, :location)
  end
end
