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
# recipe
testing specs for recipes:
name: string
summary: text
description: text


- name must be present
- name must be between 5 and 100 characters
- summary must be present
- summary must be between 10 and 150 characters
- description must be present
- description must be between 20 and 500 characters
- chef_id must be present
