describe "Cart" do

   before(:each) do
    @buyer = User.create(:name => "Aaron Bodkin")
    @cart = Cart.create(:owner_id => @buyer.id)
    @jewelry_store = Store.create(:owner_id => @buyer.id, :name => "Bedazzled", :description => "antique jewelry collectors")
    @necklace = Product.create(:store_id => @jewelry_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace")


    @seller = User.create(:name => "Patricia Morris")
    @seller_cart = Cart.create(:owner_id => @seller.id)
    @store = Store.create(:owner_id => @seller.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10)
    @hat = Product.create(:store_id => @store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20)
  end
 
  it "knows about its buyer" do
    expect(@cart.buyer).to eq(@buyer)
  end

  it "has many line items in it" do
    scarf_line_item = LineItem.create(:product_id => @scarf.id, :cart_id => @cart.id)
    hat_line_item = LineItem.create(:product_id => @hat.id, :cart_id => @cart.id)
    necklace_line_item = LineItem.create(:product_id => @necklace.id, :cart_id => @seller_cart.id)

    expect(@cart.line_items).to include(scarf_line_item)
    expect(@cart.line_items).to include(hat_line_item)
    expect(@cart.line_items).to_not include(necklace_line_item)

    expect(@seller_cart.line_items).to_not include(scarf_line_item)
    expect(@seller_cart.line_items).to_not include(hat_line_item)
    expect(@seller_cart.line_items).to include(necklace_line_item)
  end

  it "has many products in it" do
    scarf_line_item = LineItem.create(:product_id => @scarf.id, :cart_id => @cart.id)
    hat_line_item = LineItem.create(:product_id => @hat.id, :cart_id => @cart.id)
    necklace_line_item = LineItem.create(:product_id => @necklace.id, :cart_id => @seller_cart.id)

    expect(@cart.products).to include(@scarf)
    expect(@cart.products).to include(@hat)
    expect(@cart.products).to_not include(@necklace)

    expect(@seller_cart.products).to_not include(@scarf)
    expect(@seller_cart.products).to_not include(@hat)
    expect(@seller_cart.products).to include(@necklace)
  end

  it "knows about the stores where each of its products came from" do
    scarf_line_item = LineItem.create(:product_id => @scarf.id, :cart_id => @cart.id)
    hat_line_item = LineItem.create(:product_id => @hat.id, :cart_id => @cart.id)
    necklace_line_item = LineItem.create(:product_id => @necklace.id, :cart_id => @seller_cart.id)

    expect(@cart.stores).to include(@store)
    expect(@cart.stores).to_not include(@jewelry_store)

    expect(@seller_cart.stores).to_not include(@store)
    expect(@seller_cart.stores).to include(@jewelry_store)
  end

end
