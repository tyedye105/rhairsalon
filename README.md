Hair Salon
Create an application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

The following user stories should be completed:

As a salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.
Additional Requirements
For this code review, please use the following names for your databases:

Production Database: hair_salon
Development Database: hair_salon_test
Resource names will be clients and stylists

In your README, include database setup instructions with your database names and tables for (see example for 'To Do' application below):

In PSQL:

CREATE DATABASE to_do;
CREATE TABLE lists (id serial PRIMARY KEY, name varchar);
CREATE TABLE tasks (id serial PRIMARY KEY, description varchar);
Objectives
Your code will be reviewed for the following objectives:

Use of standard naming conventions for database tables and columns.
Correct set up of a one-to-many relationship.
Execution of CRUD functionality in class methods and routes.
Use of RESTful routes.
All previous code standards met. (Except you are not required to deploy to Heroku this week.)
Required functionality was in place by the 5:00pm Friday deadline.
Project is in a polished, portfolio-quality state.
Project demonstrates an understanding of this week's concepts. If prompted, you can discuss your code with an instructor using correct terminology.
