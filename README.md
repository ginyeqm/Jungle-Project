# Jungle

## Description
Jungle is a mini e-commerce application built with Rails 4.2 for the purposes of online shopping. A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Final Product
!["Screenshot of URLs login page"](https://github.com/ginyeqm/Jungle-Project/blob/master/doc/MainPage.png)]
!["Screenshot of URLs login page"](https://github.com/ginyeqm/Jungle-Project/blob/master/doc/Product.png)
!["Screenshot of URLs login page"](https://github.com/ginyeqm/Jungle-Project/blob/master/doc/MyCart.png)
!["Screenshot of URLs login page"](https://github.com/ginyeqm/Jungle-Project/blob/master/doc/Stripe.png)
!["Screenshot of URLs login page"](https://github.com/ginyeqm/Jungle-Project/blob/master/doc/OrderedPage.png)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)

* PostgreSQL 9.x
* Bcrypt
* Bootstrap
* Byebug
* Capybara
* Database_Cleaner
* Faker
* jQuery-Rails
* RMagick
* Sass
* Spring
* Stripe


