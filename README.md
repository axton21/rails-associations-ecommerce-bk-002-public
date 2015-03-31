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

Don't forget to migrate your database. To migrate for your tests, run `rake db:migrate ACTIVE_RECORD_ENV=test`. Run `rake console` if you want to look at your databse.

You'll be building migrations and filling in models to get the tests to pass as described. Look at the specs to guide you. You'll be adding columns to the pre-existing tables and you'll be associations to the models.

## Resources

* [Class Methods](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html)
* [Association Basics](http://guides.rubyonrails.org/association_basics.html)
