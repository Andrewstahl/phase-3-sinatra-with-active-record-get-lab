class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    baked_goods = BakedGood.all
    baked_goods.to_json
  end
  
  get '/baked_goods/by_price' do
    baked_good = BakedGood.all.order('price DESC')
    baked_good.to_json(only: [:name, :price])
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.order('price DESC').limit(1)
    baked_good.to_json
  end


  # add routes

end
