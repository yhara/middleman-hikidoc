describe "middleman-hikidoc" do
  it "should convert *.hd to *.html" do
    Dir.chdir(File.dirname(__FILE__)) do
      system "middleman build"
      converted = File.read("build/index.html")

      expect(converted).to eq("<h1>Hi</h1>\n")
    end
  end
end
