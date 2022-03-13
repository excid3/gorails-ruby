# GoRails CLI

[![Gem Version](https://badge.fury.io/rb/gorails.svg)](https://badge.fury.io/rb/gorails)

An interactive CLI for [GoRails](https://gorails.com), [Railsbytes](https://railsbytes.com), [Jumpstart](https://github.com/excid3/jumpstart), [Ruby on Rails jobs](https://jobs.gorails.com), and more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gorails'
```

And then run

```bash
gorails
```

## Usage

#### GoRails episodes

To see a list of the recent GoRails screencasts, you can run:

```sh
gorails episodes
```

#### Ruby on Rails Jobs

To see a list of Ruby on Rails job posts, you can run:

```sh
gorails jobs
```

#### Railsbytes

To see a list of Railsbytes.com templates, you can run:

```sh
gorails railsbytes
gorails railsbytes x7msKX
```

#### Jumpstart

To create a Ruby on Rails app using the [Jumpstart template](https://github.com/excid3/jumpstart), you can run:

```sh
gorails jumpstart myapp
```

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run `rake test` to run the tests. You can also run `exe/gorails` to test the gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/excid3/gorails-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/excid3/gorails-ruby/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GoRails project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/excid3/gorails-ruby/blob/master/CODE_OF_CONDUCT.md).
