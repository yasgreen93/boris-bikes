## Boris Bikes - Week 1 of Makers Academy

A command-line interface program that runs all docking stations, simulate the bikes, and emulate all infrastructure of the Boris Bike network.

Test-driven with RSpec and written in Ruby.

#### Installation and setup

Clone down the repository and change into the directory:  
```
git clone https://github.com/yasgreen93/boris-bikes.git
cd boris-bikes
```
Install the gems required in the project:  
```
gem install bundle
bundle
```

In IRB or PRY require the relevant files:
```
$ irb
2.2.3 :001 > require './lib/docking_station.rb'
 => true
2.2.3 :002 > require './lib/garage.rb'
 => true
2.2.3 :003 > require './lib/van.rb'
 => true
 ```
