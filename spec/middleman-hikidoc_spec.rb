describe "middleman-hikidoc" do
  it "should convert *.hd to *.html" do
    Dir.chdir(File.dirname(__FILE__)) do
      system "bundle exec middleman build"
      converted = File.read("build/index.html")

      expect(converted).to eq("<h1>Hi</h1>\n<hr />\n")
    end
  end

  it "should be able to handle options" do
    Dir.chdir(File.dirname(__FILE__)) do
      system "LEVEL=2 bundle exec middleman build"
      converted = File.read("build/index.html")

      expect(converted).to eq("<h2>Hi</h2>\n<hr />\n")
    end
  end

  it "should support :html mode" do
    Dir.chdir(File.dirname(__FILE__)) do
      system "FORMAT=html bundle exec middleman build"
      converted = File.read("build/index.html")

      expect(converted).to eq("<h1>Hi</h1>\n<hr>\n")
    end
  end
end
