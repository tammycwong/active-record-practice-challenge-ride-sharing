# Object Relations Practice Code Challenge - Ride Sharing

For this assignment, we'll be working with a Passenger domain.

We have three models: `Passenger`, `Ride`, and `Driver`.

For our purposes, a `Passenger` has many `Ride`s, a `Driver` has many `Ride`s, and a `Ride` belongs to a `Passenger` and to an `Driver`.

`Passenger` - `Driver` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_. Remember to identify a single source of truth for your data.

## Topics

- Active Record Migrations
- Object Relationships
- Active Record Queryng

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods may rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console.

You can use `rake console` to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First, prioritize getting things working. Then, if there is time at the end, refactor your code to adhere to best practices. 

## What You Already Have

The starter code has migrations and models for the initial `Driver`, `Passenger` and `Ride` models, and seed data for some `Driver`s and `Passenger`s. The schema currently looks like this: 

#### `drivers` Table
| Column        | Type    |
| ------------- | ------- |
| first_name    | String  |
| last_name     | String  |
| email         | String  |
| car           | String  |
| car_color     | String  |
| car_year      | String  |
| license_plate | String  |
| bio           | String  |
| rating        | decimal |

#### `passengers` Table
| Column     | Type    |
| ---------- | ------- |
| first_name | String  |
| last_name  | String  |
| email      | String  |
| cell_phone | String  |
| rating     | decimal |

You will need to create the migration for the `rides` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods and `.` for class methods.

Remember: Active Record gives your classes access to a lot of built-in methods! Keep in mind what methods Active Record gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a migration for the `rides` table. 

- A `Ride` belongs to a `Passenger` and a `Ride` also belongs to a `Driver`. Create a migration to create the `rides` table and in your migration, create any columns your `rides` table will need to establish these relationships.
  - The `rides` table should have a `price` column that stores a decimal
  - The `rides` table should also have a `pick_up` column that stores a string
  - The `rides` table should also have a `drop_off` column that stores a string

After creating your migration, don't forget to `rake db:migrate`. Make sure your migrations are up! Then, read through the `seeds.rb` file and use it to create instances of your `Ride` class so you can test your code.

**Once you've set up your `Ride` class**, work on building out the following deliverables.

### Object Relationship Methods

Use Active Record association macros and Active Record query methods where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Ride

- `Ride#driver`
  - should return the `Driver` instance for this ride
- `Ride#passenger`
  - should return the `Passenger` instance for this ride

#### Passenger

- `Passenger#rides`
  - returns a collection of all `Ride` instances for this passenger
- `Passenger#drivers`
  - returns a collection of all `Driver` instances that this passenger has had

#### Driver

- `Driver#rides`
  - should return a collection of all `Ride` instances for this driver
- `Driver#passengers`
  - should return a collection of all `Passenger` instances that this driver has driven

### Aggregate and Association Methods

#### Ride
- `Ride#print_details`
  - `puts` a string to the terminal to display the details of the ride
  - the string should be formatted like this: `{driver name} drove {passenger name} for {ride price} from {pick up location} to {drop off location}`

#### Driver

- `Driver#accept_ride_request(passenger, price, pick_up, drop_off)`
  - takes a `passenger` (an instance of the `Passenger` class), `pick_up` location (string), `drop_off` location (string), and a `price` (decimal) as arguments, and creates a new `ride` in the database associated with the passenger and the driver
- `Driver#total_income`
  - returns the sum of the prices for all the driver's rides
- `Driver#cancel_ride(passenger)`
  - takes a `passenger` instance and removes the ride for this driver
  - you will have to delete a row from the `rides` table to get this to work!
-  `Driver.most_active_driver`
    -  returns the `Driver` instance with the most rides
-  `Driver.best_performing_driver`
    -  returns the `Driver` instance with the highest rating

#### Passenger

- `Passenger#car_list`
  - returns a `String` of a semi-colon separated list of cars this passenger has ridden in
  - the string should be formatted like this: `Honda Accord;Mazda CX-5`
- `Passenger#average_rating`
  - returns the average rating of a passenger
- `Passenger.average_rating`
  - returns the average rating of all of the passengers
- `Passenger.worst_rated`
  - returns the `Passenger` instance with the worst rating
- `Passenger.worst_rating_in_existence`
  - returns the worst rating integer value


## Rubric

### Active Record Associations
1. No associations, no foreign key on the table.
2. Associations attempted in the model but are incorrect; foreign key is on a table but in the wrong spot.
3. Relationships properly created. Associations lead to the correct behavior but may have used the wrong macro or manually written out the methods the macro builds for us.
4. Relationships properly created, save minor mistakes in advanced deliverables. May implement advanced query methods with iterators instead of using built-in methods.
5. Relationships properly created. Advanced query methods use appropriate built-in methods.

### Build classes using OO Ruby Syntax

1. Class code has a syntax or runtime error. Code does not run at all, or exits with an error, or most Object-oriented deliverables are not implemented.
2. No syntax errors. Some deliverables function correctly. Mixes up syntax for class and instance methods, refers to variables in the wrong scope, or uses `self` incorrectly, leading to logical errors. Method and variable names do not correspond to their respective behavior or data types. Methods might be duplicated, or code includes unused methods without a clear purpose.
3. Correct class syntax for the deliverables submitted. May be incomplete or missing deliverables. Most code generally expresses intent: method and variable names match their behaviors and data types. Methods are not duplicated. Code does not have unused or methods without a clear purpose.
4. Correct class syntax for all of the submitted code. Code express intent: method and variable names indicate their behavior and data types. Some deliverables might not be complete. No methods are duplicated.
5. Correct class syntax for all deliverables, all deliverables complete. Code expresses intent: method and variable names indicate their behavior and data types, with the correct pluralization. No methods are duplicated. All methods have a clear purpose. Shared functionality is factored out into helper methods. Appropriate use of attr\_\* macros.

### Model relationships using Ruby

1. Submitted code does not relate models to each other through methods or data.
2. Models relate to each other, but incompletely. Relationship methods are missing or have logic errors, store data on the wrong model, or are missing a single source of truth.
3. Models relate to each other as specified in the instructions. Data is stored on the correct models, relationship methods are defined on the right models, and the logic correctly implements the relationships. Aggregate methods using the relationships may be incomplete or have errors.
4. Models relate to each other as specified in the instructions. Aggregate methods work, but might not use helper methods effectively.
5. Models relate to each other as specified in the instructions. Aggregate methods use helper methods effectively.

### Solve problems with collections of data

1. Does not attempt to solve collections problems, or has syntax errors in collection code.
2. Collections methods have runtime or logic errors. Collections methods may use the wrong iterators, have incorrect logic, or many of the collections methods are unimplemented.
3. Some collections methods work correctly, though several might be unimplemented. Code may not use the appropriate built in method for each problem, or duplicate logic instead of using helper methods.
4. All collections methods are implemented and function correctly. Most use appropriate higher-level built-in methods. Methods may duplicate logic instead of using helper methods.
5. All collections methods implemented and function correctly, using appropriate higher-level built-in methods. Shared logic is factored out to helper methods.
