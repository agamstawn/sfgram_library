# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  3.1.2p20

* Rails version
  7.0.4.1

* System dependencies

* Configuration
  Change the username and password in database.yml with your own credential postgre
* Database creation and initialization
  run/execute "bundle exec rails db:setup"

* Database Seed
  
  run/execute "bundle exec rails db:seed"
  
  remove (".") from file migrations in db/migrate
  from:
    - .20230201152416_add_index_to_authors.rb
    - .20230201153159_add_index_to_books.rb
    - .20230201153159_add_index_to_books.rb
  to:
    - 20230201152416_add_index_to_authors.rb
    - 20230201153159_add_index_to_books.rb
    - 20230201153159_add_index_to_books.rb
  
  uncomment book relational model after all migration success in models/book.rb
  
  uncomment author relational model after all migration success in models/author.rb

* How to setup bootstrap
  run/execute "rails css:install:bootstrap"
  and
  run/execute "./bin/importmap pin bootstrap"

  
* How to run the test suite
  run/execute "rspec ./spec/models/author_spec.rb"
  run/execute "rspec ./spec/models/book_spec.rb"

* How to run Application 
  run/execute "rails s"

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# sfgram_library
* Troubleshoot
case : 
PG::UniqueViolation: ERROR: duplicate key value violates unique constraint?

solution :
rails c
then execute "ActiveRecord::Base.connection.reset_pk_sequence!('table_name')"


.mb3 
      = search_form_for @q, url: :authors do |form|
        .form-group
          = form.label :search_by_name
          = form.text_field :name_cont
        .form-group 