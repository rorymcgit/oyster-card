# Makers Academy - Oyster card Challenge (Week 2)

This project was written in my second week of Makers Academy. I used RSpec to TDD an object oriented system in Ruby which imitates various features of the TFL oyster card such as topping up, touching in/out and storing journey data for fare calculations.

Instructions for use:
- Clone this repo
- Run ```bundle``` to install dependencies
- Run ```rspec``` to view tests
- Run ```irb```

```
2.2.3 :001 > require './lib/oystercard'
 => true
2.2.3 :002 > require './lib/station'
 => true
2.2.3 :003 > card = Oystercard.new
 => #<Oystercard:0x007fefa38cb000 @current_journey=#<Journey:0x007fefa38cafd8 @all_journeys=[], @single_journey={}>, @in=false, @balance=0>
2.2.3 :004 > card.topup(20)
 => 20
2.2.3 :005 > penge = Station.new("Penge", 4)
 => #<Station:0x007fefa38b9738 @name="Penge", @zone=4>
2.2.3 :006 > whitechapel = Station.new("Whitechapel", 2)
 => #<Station:0x007fefa38a1930 @name="Whitechapel", @zone=2>
2.2.3 :007 > card.touch_in(penge)
 => #<Station:0x007fefa38b9738 @name="Penge", @zone=4>
2.2.3 :008 > card.touch_out(whitechapel)
 => #<Journey:0x007fefa3891e68 @all_journeys=[{:in=>#<Station:0x007fefa38b9738 @name="Penge", @zone=4>}, {:out=>#<Station:0x007fefa38a1930 @name="Whitechapel", @zone=2>}], @single_journey={}>
 2.2.3 :009 > card.balance
 => 17
```
