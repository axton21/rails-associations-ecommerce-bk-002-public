describe "Store" do

   before(:each) do
    @buyer = User.create(:name => "Aaron Bodkin")
    @cart = Cart.create(:buyer_id => @buyer.id)
    @owner = User.create(:name => "Patricia Morris")
    @store = Store.create(:owner_id => @owner.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10)
    @hat = Product.create(:store_id => @store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20)
  end
 
  it "knows about its owner" do
    expect(@store.owner).to eq(@owner)
  end

  it "has many products in it" do
    expect(@store.products_for_sale).to include(@scarf)
    expect(@store.products_for_sale).to include(@hat)
  end

end
