describe "Models" do
  describe "only use associations, no custom methods: " do
    it "'def' does not appear in any model" do
      models = ["cart", "line_item", "product", "store", "user"]
      models.each do |model|
        contents = read_file("app/models/#{model}.rb")
        expect(contents).to_not include("def")
      end
    end
    it "'define_method' does not appear in any model" do
      models = ["cart", "line_item", "product", "store", "user"]
      models.each do |model|
        contents = read_file("app/models/#{model}.rb")
        expect(contents).to_not include("define_method")
      end
    end
  end
end