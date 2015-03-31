describe "Product" do

   before(:each) do
    @buyer = User.create(:name => "Aaron Bodkin")
    @cart = Cart.create(:owner_id => @buyer.id)
    @seller = User.create(:name => "Patricia Morris")
    @store = Store.create(:owner_id => @seller.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shop")
    
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10, :price => 67.88)
    @hat = Product.create(:store_id => @store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20, :price => 4.25)
  end
 
  it "knows about its store" do
    expect(@scarf.store).to eq(@store)
    expect(@hat.store).to eq(@store)
  end

  it "knows about its seller" do
    expect(@scarf.seller).to eq(@seller)
    expect(@hat.seller).to eq(@seller)
  end

  it "knows about its potential_sales" do
    another_buyer = User.create(:name => "Amanda McFee")
    amandas_cart = Cart.create(:owner_id => another_buyer.id)

    first_scarf_line_item = LineItem.create(:cart_id => @cart.id, :product_id => @scarf.id)
    second_scarf_line_item = LineItem.create(:cart_id => amandas_cart.id, :product_id => @scarf.id)

    expect(@scarf.potential_sales).to include(first_scarf_line_item)
    expect(@scarf.potential_sales).to include(second_scarf_line_item)
  end

  it "knows about its buyers" do
    another_buyer = User.create(:name => "Amanda McFee")
    
    amandas_cart = Cart.create(:owner_id => another_buyer.id)
    first_scarf_line_item = LineItem.create(:cart_id => @cart.id, :product_id => @scarf.id)
    second_scarf_line_item = LineItem.create(:cart_id => amandas_cart.id, :product_id => @scarf.id)

    expect(@scarf.buyers).to include(@buyer)
    expect(@scarf.buyers).to include(another_buyer)
  end

end
