# users
aaron = User.create(:name => "Aaron Bodkin")
patricia = User.create(:name => "Patricia Morris")

# carts
aarons_cart = Cart.create(:owner_id => aaron.id)
patricias_cart = Cart.create(:owner_id => patricia.id)

# stores
jewelry_store = Store.create(:owner_id => aaron.id, :name => "Bedazzled", :description => "antique jewelry collectors")
knit_store = Store.create(:owner_id => patricia.id, :name => "Lovin' Knit", :description => "a locally sourced organic knit shot")

# products
necklace = Product.create(:store_id => jewelry_store.id, :name => "necklace", :description => "3D printed tetrahedron necklace", :price => 23.66)
scarf = Product.create(:store_id => knit_store.id, :name => "Scarf", :description => "this deep blue scarf will keep you warm and fashionable", :inventory => 10, :price => 15.88)
hat = Product.create(:store_id => knit_store.id, :name => "Hat", :description => "make a statement this winter with this grey hat", :inventory => 20, :price => 9.78)

# line_items
LineItem.create(:cart_id => aarons_cart.id, :product_id => scarf.id)
LineItem.create(:cart_id => aarons_cart.id, :product_id => hat.id)
LineItem.create(:cart_id => patricias_cart.id, :product_id => necklace.id)