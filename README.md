# README

# build

> cd unanni
> rails db:create
> rails db:migrate

# run
> rails s

# Gemfile
new gems included

- cancancan - to manage permissions
- Bcrypt -  to manage passwords
- rspec-rails - DSL language to create ruby specs
- database_cleaner-active_record - to reset test database in every spec

# Permissions
The User model has an enum attribute called `role` (admin, no_admin), the page permissions are inside Ability class, where we can manage which page each type of user can have access

# Specs
Integration tests
- SessionsControllers
- UsersControllers
