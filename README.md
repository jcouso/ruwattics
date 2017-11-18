# Ruwattics

API client side for connection with Wattics

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruwattics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruwattics

## Usage

Here is some basic commands to get you started with the ruwattics API

```ruby
require 'ruwattics.rb'

config = User.new(:DEVELOPMENT, username, password)

simple = SimpleMeasurement.new
simple.id = "meter-id-01"
simple.setTimeNow
simple.value = 12.5
Sender.send(simple, config)

electricMensurment = ElectricityMeasurement.new
electricMensurment.id = "meter-id-02"
electricMensurment.setTimeNow
electricMensurment.activePowerPhaseA = 5.12
electricMensurment.reactivePowerPhaseA = 1.5
#/

Sender.send(electricMensurment, config)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruwattics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jcouso/ruwattics/blob/master/CODE_OF_CONDUCT.md).
