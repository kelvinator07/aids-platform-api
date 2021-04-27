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


* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
