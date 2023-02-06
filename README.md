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

* Database setup
 
  run/execute "bundle exec rails db:setup"
  
  remove (".") from file migrations in db/migrate
  
  from:
  
    - .20230201152416_add_index_to_authors.rb
    - .20230201153159_add_index_to_books.rb
    - .20230202142334_add_author_reference_to_books.rb
  
  to:
  
    - 20230201152416_add_index_to_authors.rb
    - 20230201153159_add_index_to_books.rb
    - 20230202142334_add_author_reference_to_books.rb

  run/execute "bundle exec rails db:migrate"

  update author_id column with author using this command " Book.all.map{|b| b.update(author_id: b.author)}" via console

  uncomment book relational model and validations after all migration success in models/book.rb
  
  uncomment author relational model and validations after all migration success in models/author.rb

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

Case : 

PG::UniqueViolation: ERROR: duplicate key value violates unique constraint?

Solution :

rails c

then execute "ActiveRecord::Base.connection.reset_pk_sequence!('table_name')"
