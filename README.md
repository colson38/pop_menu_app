# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Notes: When dealing with the belongs_to, I added validation validates :menu, :presence => true instead of validating the menu_id because the item could be saved with ANY id. This way cares about the object existence
