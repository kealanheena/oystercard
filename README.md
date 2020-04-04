### [Makers Academy](http://www.makersacademy.com) - Week 2 Project

# Oystercard Challenge


[User Story](#Story) | [Objects & Methods](#Methods)

## <a name="Outline">Outline</a>



## <a name="Task">The Task</a>

This week's challenge will start with going back over the basics I covered last week in Boris Bikes, giving me the chance to reinforce what I learned last week. I'll then be challenged to build a more complex system which should really stretch my skills in Ruby, TDD and object-oriented design.


## <a name="Goals">Goals</a>

### I write code that is easy to change

Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.

### I can test-drive my code

Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.

### I can build with objects
Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place.

<a name="Story">User Story</a>

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

<a name="Methods">Objects & Methods</a>

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby

## Features

You'll be able to:

- Create and oyster card and add money to it on creation
- Top up your oyster card
- Tap in and out of stations
- See all your previous journeys
- Be denied access if you have insufficient funds
- Be charged a penalty for not tapping in or out of a station
- Have your fare deducted from your oyster card balance

## Getting Started

This programme is used in the terminal.

#### To Start

- Run "ruby  oystercard.rb" file in terminal.

## Running the tests

You can run tests by running "rspec" in oystercard file.

### Tests 

### Oyster Card class
```
expect to be create with 0 pounds as a default
expect oystercard to take an argument which will be the balance
expect top up method to take an argument an top the card up by the number passed as an argument
expect oyster card to have a top up limit and throw an error if you try to top up over that limit
expect in journey method to equal true after touching in and false after touching out, default should be false
expect to raise a error if you don't have the minimum balance on your oyster card when you touch in
expect to remember the station after touching in
expect to deduct fare on touch out
expect to change the entry station back to nil after storing it as a journey
expect to save your journey to a journey list array
```

### Station class
```
expect the station to have a name
expect the station to have a zone
```

## Versioning

"oystercard" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
