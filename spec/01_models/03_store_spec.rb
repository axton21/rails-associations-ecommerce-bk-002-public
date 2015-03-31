describe "Store" do

   before(:each) do
    @buyer = User.create(:name => "Aaron Bodkin")
    @cart = Cart.create(:owner_id => @buyer.id)
    @owner = User.create(:name => "Patricia Morris")
    @store = Store.create(:owner_id => @owner.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10)
    @hat = Product.create(:store_id => @store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20)
  end
 
  it "knows about its owner" do
    expect(@store.owner).to eq(@owner)
  end

<<<<<<< HEAD:spec/models/03_store_spec.rb
  it "has many products in it" do
    expect(@store.products).to include(@scarf)
    expect(@store.products).to include(@hat)
=======
  it "has many products_for_sale in it" do
    expect(@store.products_for_sale).to include(@scarf)
    expect(@store.products_for_sale).to include(@hat)
>>>>>>> 8a3ae1f... make carts have owners instead of buyers, add spec for drawing of model:spec/01_models/03_store_spec.rb
  end

end
