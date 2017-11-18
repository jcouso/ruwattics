# Ruwattics

API client side that connection with Wattics plataform. You can send simple measuarements or eletric measurements.

## Installation
You will need a local copy of the files, download them from this repository.

```sh
$ git clone https://github.com/jcouso/ruwattics
$ cd ruwattics
$ gem build ruwattics.gemspec
$ gem install ruwattics
```
## Usage

Here is some basic commands to get you started with the ruwattics API

```ruby
require 'ruwattics.rb'

user = User.new(:DEVELOPMENT, username, password)

simple = SimpleMeasurement.new
simple.id = "meter-id-01"
simple.setTimeNow
simple.value = 12.5
Sender.send(simple, user)

electricMensurment = ElectricityMeasurement.new
electricMensurment.id = "meter-id-02"
electricMensurment.setTimeNow
electricMensurment.activePowerPhaseA = 5.12
electricMensurment.reactivePowerPhaseA = 1.5
# ...

Sender.send(electricMensurment, user)
```

## Development

You may run the test using the following command, remember to update the global variables of username and password at the top of the file ruwattics_spec.rb to valid ones before running the testes.

```sh
$ rake spec
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruwattics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jcouso/ruwattics/blob/master/CODE_OF_CONDUCT.md).
