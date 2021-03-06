Admin.controllers :items do

  get :index do
    @items = Item.all
    render 'items/index'
  end

  get :new do
    @item = Item.new
    render 'items/new'
  end

  post :create do
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect url(:items, :edit, :id => @item.id)
    else
      render 'items/new'
    end
  end

  get :edit, :with => :id do
    @item = Item.find(params[:id])
    render 'items/edit'
  end

  put :update, :with => :id do
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item was successfully updated.'
      redirect url(:items, :edit, :id => @item.id)
    else
      render 'items/edit'
    end
  end

  delete :destroy, :with => :id do
    item = Item.find(params[:id])
    if item.destroy
      flash[:notice] = 'Item was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Item!'
    end
    redirect url(:items, :index)
  end
end