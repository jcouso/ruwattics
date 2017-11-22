# Ruwattics

Ruby client side API that connection with Wattics plataform. You can send simple measuarements or electric measurements.

## Installation
You will need a local copy of the files, download them from this repository.

```sh
$ git clone https://github.com/jcouso/ruwattics
$ cd ruwattics
$ gem install ruwattics
```
## Usage

Here is some basic commands to get you started with the ruwattics API. Remember use a valid username and password.

```ruby
require 'ruwattics'

user = User.new(:DEVELOPMENT, 'username', 'password')
agent = Agent.new

simple = SimpleMeasurement.new
simple.id = "meter-id-01"
simple.setTimeNow
simple.value = 12.5
agent.send(simple, user)

electricMensurment = ElectricityMeasurement.new
electricMensurment.id = "meter-id-02"
electricMensurment.setTimeNow
electricMensurment.activePowerPhaseA = 5.12
electricMensurment.reactivePowerPhaseA = 1.5
# ...

agent.send(electricMensurment, user)
```

You may later access the results using the following command.

```ruby
agent.results
```

## Testing

You may run the test using the following command.

```sh
$ rake spec
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruwattics project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jcouso/ruwattics/blob/master/CODE_OF_CONDUCT.md).
