describe "User" do

  before(:each) do
    binding.pry
    @user = User.create(:name => "Aaron Bodkin")
    @seller = User.create(:name => "Patricia Morris")
    @store = Store.create(:owner_id => @seller.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")
    @scarf = Product.create(:store_id => @store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10)
    @hat = Product.create(:store_id => @store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20)
  end
 
  it "has a name" do
    expect(@user.name).to eq("Aaron Bodkin")
  end

  it "knows about the stores it owns" do
    knitting_factory = Store.create(:owner_id => @user.id, :name => "The Knitting Factory", :description => "Hand-knit scarves for him and her!")
    jewelry_outlet = Store.create(:owner_id => @user.id, :name => "Jewelry Outlet", :description => "We're known for our unique collection of costume jewelry!")
    expect(@user.stores).to include(knitting_factory)
    expect(@user.stores).to include(jewelry_outlet)
  end

  it "knows about its products for sale" do
    user_store = Store.create(:owner_id => @user.id, :name => "Jewelry Outlet", :description => "We're known for our unique collection of costume jewelry!")
    necklace = Product.create(:store_id => user_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace")
    bracelet = Product.create(:store_id => user_store.id, :name => "bracelet", :description => "wrought iron bracelet")
    expect(@user.products).to include(necklace)
    expect(@user.products).to include(bracelet)
    expect(@user.products).to_not include(@scarf)
    expect(@user.products).to_not include(@hat)
  end

  it "knows about its carts" do
    first_cart = Cart.create(:buyer_id => @user.id)
    second_cart = Cart.create(:buyer_id => @user.id)
    expect(@user.carts).to include(first_cart)
    expect(@user.carts).to include(second_cart)
  end

  it "knows about its line items that its purchasing" do
    aarons_store = Store.create(:owner_id => @user.id, :name => "Jewelry Outlet", :description => "We're known for our unique collection of costume jewelry!")
    necklace = Product.create(:store_id => aarons_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace")
    patricias_cart = Cart.create(:buyer_id => @seller.id)
    necklace_line_item = LineItem.create(:cart_id => patricias_cart.id, :product_id => necklace.id)

    cart = Cart.create(:buyer_id => @user.id)
    scarf_line_item = LineItem.create(:cart_id => cart.id, :product_id => @scarf.id)
    hat_line_item = LineItem.create(:cart_id => cart.id, :product_id => @hat.id)

    expect(@user.line_items).to_not include(necklace_line_item)
    expect(@user.line_items).to include(scarf_line_item)
    expect(@user.line_items).to include(hat_line_item)

    expect(@seller.line_items).to include(necklace_line_item)
    expect(@seller.line_items).to_not include(scarf_line_item)
    expect(@seller.line_items).to_not include(hat_line_item)    
  end

  it "knows about the products that it has sold" do
    aarons_store = Store.create(:owner_id => @user.id, :name => "Jewelry Outlet", :description => "We're known for our unique collection of costume jewelry!")
    necklace = Product.create(:store_id => aarons_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace")
    patricias_cart = Cart.create(:buyer_id => @seller.id)
    necklace_line_item = LineItem.create(:cart_id => patricias_cart.id, :product_id => necklace.id)

    cart = Cart.create(:buyer_id => @user.id)
    scarf_line_item = LineItem.create(:cart_id => cart.id, :product_id => @scarf.id)
    hat_line_item = LineItem.create(:cart_id => cart.id, :product_id => @hat.id)

    expect(@user.sold_products).to include(necklace)
    expect(@user.sold_products).to_not include(@scarf)
    expect(@user.sold_products).to_not include(@hat)

    expect(@seller.sold_products).to_not include(necklace)
    expect(@seller.sold_products).to include(@scarf)
    expect(@seller.sold_products).to include(@hat)   
  end

  it "knows about the products it has purchased" do
    aarons_store = Store.create(:owner_id => @user.id, :name => "Jewelry Outlet", :description => "We're known for our unique collection of costume jewelry!")
    necklace = Product.create(:store_id => aarons_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace")
    patricias_cart = Cart.create(:buyer_id => @seller.id)
    necklace_line_item = LineItem.create(:cart_id => patricias_cart.id, :product_id => necklace.id)

    cart = Cart.create(:buyer_id => @user.id)
    scarf_line_item = LineItem.create(:cart_id => cart.id, :product_id => @scarf.id)
    hat_line_item = LineItem.create(:cart_id => cart.id, :product_id => @hat.id)

    expect(@user.purchased_products).to_not include(necklace)
    expect(@user.purchased_products).to include(@scarf)
    expect(@user.purchased_products).to include(@hat)

    expect(@seller.purchased_products).to include(necklace)
    expect(@seller.purchased_products).to_not include(@scarf)
    expect(@seller.purchased_products).to_not include(@hat)   
  end
end
