begin
  require "jeweler"
    Jeweler::Tasks.new do |gem|
        gem.name = "spud_shop"
        gem.summary = "Spud Shop Engine"
        gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
        gem.add_dependency 'spud_core', '>= 0.8.0'
        gem.add_dependency 'activemerchant'
        gem.add_dependency 'active_shipping'
        gem.add_dependency 'paperclip'
	gem.authors = 'David Estes'
	gem.email = 'destes@redwindsw.com'
        # other fields that would normally go in your gemspec
        # like authors, email and has_rdoc can also be included here
	end
rescue
	puts "Jeweler or one of its dependencies is not installed."
end
