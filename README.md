# Blog

* Create database

Copy config/database.example.yml to config/database.yml and add user and password fields used by postgresql.

Then run

  `rake db:create && rake db:migrate`

* Deployment

Deploy is running automatically for staging and production branches through CircleCI.

* Setting up the server

To install all required software on server, use this project: https://github.com/oksanka-blaze/ansible
