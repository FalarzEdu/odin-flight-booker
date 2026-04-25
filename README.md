# Welcome!

## Summary

- [Introduction](#Introduction)
  - [Objectives Overview](#objectives-overview)
  - [Primary Objectives](#primary-objectives)
  - [Secondary Objectives](#secondary-objectives)
- [Project Details](#project-details)

## Introduction

This project was developed with the unique goal of improving my abilities on Ruby on Rails,
 a language which I've been studying for quite a while. This is the first (of many still to come)
"complete" project built with this intention.

### Objectives Overview

Although this is going to be a great opportunity to play around with many rails features, 
there are some specific features I intend to develop and I think that there is enough room
to address them all.

#### Primary Objectives

- Advanced Forms Management;
- Active Record Callbacks, Associations, Queries, Migrations and Polymorphic Relations.
- Basic Authentication (with Devise) and Session Management.

#### Secondary Objectives

- Turbo
- Asset Pipeline

## Project Details

The purpose of this project is to build a Flight Booker, making use of the many useful
resources given out-of-the-box by Rails.
The main functionalities are basically Flight Bookings by users, with the option to add one or more
passengers to every booking. The app is going to be built with scalability in mind—and this will
reflect some decisions along the way. Some of these features won't be used right away, but the idea is to
construct the project looking to a farther horizon.

These are the main Domain Rules that will dictate the development of this project:

> The implementation of anything related to payment will only be mocked.
> No owned or third-party payment gateways will be used.

- A user should be able to create one or more bookings.
- A user should be able to add more passengers to a booking by inserting their personal data.
- A user can create of modify its own cards information
- A user should be able to decide if it's going to be one of the passengers.
  - If not, the user should not need to input his personal data because it's already stored.
- The system should be able to handle different forms of payment (like credit card or the brazilian PIX)
- The system should be capable of handling multiple payments for a single booking
  - This feature won't be implemented, only it's "skeleton" (at least for now).
- Each booking can have many passengers
- Each booking should only be related to one flight
- Each flight should hold information about its own departure and arrival datetime and cities, as well as price and capacity.
- Each flight is related to a route
- Each route can be used on many flights
- Each route should hold the information about the departure and arrival cities.

## Database

### DBMS

The chosen DMBS is PostgreSQL. This decision comes from the fact that this tool is popular, and its usage is very
widespread.

