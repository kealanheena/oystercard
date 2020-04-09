### [Makers Academy](http://www.makersacademy.com) - Week 2 Project

# Oystercard Challenge

This week's challenge will start with going back over the basics I covered last week in Boris Bikes, giving me the chance to reinforce what I learned last week. I'll then be challenged to build a more complex system which should really stretch my skills in Ruby, TDD and object-oriented design.

## User Stories

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

- #initialize
  - should initialize the class with a balance of zero
- #top_up
  - should add given amount to balance
  - should not push balance above limit
- #deduct
  - should deduct a specified fare,then return the remaining balance
- #touch_in
  - should charge a penalty of £6 if you touch in without touching out
  - should raise an error if user tries to travel under minimum balance
- #touch_out
  - should deduct a correct amount from my card when journey is complete
  - should accept an argument of the exit station, and store it


### Station class

- #initialize
  - should create a class instance of the station name
  - should create a class instance of the station zone

## Versioning

"oystercard" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
