# SHOPIFY_CHALLENGE

This is the shopify challenge to create a backend API.

## Prerequisites

Ruby version: 2.5.1
Rails version: 5.2.1

## Getting Started

1. Clone this reposirory on your local machine.
2. Run `bundle install` to install dependencies.
3. Run `rake db:create && rake db:schema:load` to create and load db.
4. Run `rails db:migrate` to migrate the database.
5. Run `rake db:seed` to seed data.
6. Use `rails server` command to start the app.
7. Visit http://localhost:4000/shops.

## Demo

The purpose of this exercise is to create databases with the right relationships between them. Shops have many products, products have many line items, many line items have orders and shops have many orders. 