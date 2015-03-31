---
languages: ruby
tags: ORM, ActiveRecord, associations
resources: 2
---

# Data Modeling - Etsy

![ecommerce shopping cart 3d image](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/rails/ecommerce.jpg)

## Objective

You'll be building a really simple store domain using ActiveRecord associations. To accomplish this, you'll be changing/making new migrations and adding associations to the models.

For the purposes of this basic, basic e-commerce domain you'll be assuming that every item in a cart has already been purchased.

## Instructions

Fork and clone this repository, and get your tests to pass.

You have rake tasks available to you: `rake db:migrate` and `rake db:reset`. Don't forget to migrate your database!

The rspec tests are complete and should not need to change. You'll be building migrations and filling in classes to get the tests to pass as described.

Look at the specs to guide you. You'll be adding columns to the pre-existing tables and associations to their models.

## Resources

* [Class Methods](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)
* [Association Basics](http://guides.rubyonrails.org/association_basics.html)