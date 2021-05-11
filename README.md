# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.6.6 or 3.0.1- Specify in Gemfile

 Delete Gemfile.lock
 Run bundle install
 rake db:create
 rake db:migrate

* Create a cloudinary.yml file in /config folder with the following contents

---
development:
  cloud_name:
  api_key:
  api_secret:
  enhance_image_tag: true
  static_file_support: false
production:
  cloud_name:
  api_key:
  api_secret:
  enhance_image_tag: true
  static_file_support: true
test:
  cloud_name:
  api_key:
  api_secret:
  enhance_image_tag: true
  static_file_support: false

  Below are the setups to run Ruby on Rails application on your system.

  Make sure Ruby is installed on your system. Fire command prompt and run command:

  ruby -v
  Make sure Rails is installed

  rails -v
  If you see Ruby and Rails version then you are good to start, other wise Setup Ruby On Rails on Ubuntu

  Once done, Now

  Clone respected git repository

  git clone url
  Install all dependencies

  bundle install
  Create db and migrate schema

  rake db:create
  rake db:migrate
  
  Now run your application

  rails server

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
