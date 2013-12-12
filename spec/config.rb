activate :hikidoc do |f|
  f.level = ENV['LEVEL'].to_i if ENV['LEVEL']
end
