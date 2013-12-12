activate :hikidoc do |f|
  f.level = ENV['LEVEL'].to_i if ENV['LEVEL']
  f.format = :html if ENV['FORMAT'] == "html"
end
