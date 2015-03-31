describe "saved a drawing to the image folder" do
  it "a file called drawing exists in the public/img folder" do
    possible_extentions = ["png", "jpg", "gif", "jpeg"]
    possible_file_names = possible_extentions.map {|ext| "public/img/drawing.#{ext}"}
    file_name = Dir["public/img/*"][0]
    expect(file_name).to satisfy { |n| possible_file_names.include?(n) }
  end

  it "the drawing file is not empty" do
    file_names = Dir["public/img/*"]
    contents = read_file(file_names[0])
    expect(contents.length).to be > 500
  end
end