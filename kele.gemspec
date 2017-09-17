Gem::Specification.new do |s|
   s.name          = 'kele'
   s.version       = '0.0.1'
   s.date          = '2017-09-17'
   s.summary       = 'Kele API Client'
   s.description   = 'A client for the Bloc API'
   s.authors       = ['Renee Bain']
   s.email         = 'rbain02@gmail.com'
   s.files         = ['lib/kele.rb', 'lib/roadmap.rb']
   s.require_paths = ["lib"]
   s.homepage      =
     'http://rubygems.org/gems/kele'
   s.license       = 'MIT'
   s.add_runtime_dependency 'HTTParty', '~> 0.13', 'json'
 end
