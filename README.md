# SfMobileFoodFacilities

This an api-wrapper gem for SF open data portal - Mobile Food Facility Permits which includes the name of vendor, location, type of food sold, status of permit, and more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sf_mobile_food_facilities'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sf_mobile_food_facilities

## Usage

    $ SfMobileFoodFacilities::Location.all

    $ SfMobileFoodFacilities::Location.first

    $ SfMobileFoodFacilities::Location.last

    $ SfMobileFoodFacilities::Facility::where(address: "400 CALIFORNIA ST", status: "APPROVED")

    $ SfMobileFoodFacilities::Facility::find_by(:address, "400 CALIFORNIA ST")

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sf_mobile_food_facilities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
