describe "LineItem" do

  before(:each) do
    @buyer = User.create(:name => "Aaron Bodkin")
    @cart = Cart.create(:buyer_id => @buyer.id)
    @seller = User.create(:name => "Patricia Morris")
    @store = Store.create(:owner_id => @seller.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10)
    @line_item = LineItem.create(:cart_id => @cart.id, :product_id => @scarf.id)
  end

  it "knows about its cart" do
    expect(@line_item.cart).to eq(@cart)
  end

  it "knows about its buyer" do
    expect(@line_item.buyer).to eq(@buyer)
  end

  it "knows about its product" do
    expect(@line_item.product).to eq(@scarf)
  end

  it "knows about its store" do
    expect(@line_item.store).to eq(@store)
  end

  it "knows about its seller" do
    expect(@line_item.seller).to eq(@seller)
  end

end