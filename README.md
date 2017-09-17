# Kele

Kele A Ruby Gem API client that allows authorized users to access the Bloc API. Students can get their user and enrollment info, check their mentor’s availability, see their course roadmaps, and even submit their assignments through the command line. This Gem also offers the ability to read, send, and receive messages. All data is parsed and neatly formatted into JSON for easy readability.

# Installation

Add this line to your application's Gemfile:

gem 'kele'
And then execute:

$ bundle
Or install it yourself as:

$ gem install kele
Usage


# Development

After checking out the repo, run bin/setup to install dependencies. Then, run rake spec to run the tests. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and tags, and push the .gem file to rubygems.org.

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/kele.

# License

The gem is available as open source under the terms of the MIT License.

irb -r kele -I ./lib
