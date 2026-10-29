# star-wars-sql-database
PostgreSQL relational database of the Star Wars franchise (group project).

# Star Wars Franchise Database

A PostgreSQL relational database covering Star Wars films and television
series, including actors, directors, studios, and box office finances.
Built as a semester-long group project for INST123.

## Overview
The database organizes the franchise's movies and TV series and the
relationships between them, so trends can be compared across eras and
mediums. It contains 15 movies (12 released and 3 announced or rumored,
which are hypothetical), about 13 TV series, 50 actors, and 19 directors.

## Database Design
- **Core tables:** movies, series
- **Lookup tables:** actors, directors, studios
- **Linking tables:** movie_actors, series_actors, movie_directors, series_directors
- **Financial data:** movie_finances (box office gross and budget per movie)

Movies and series are kept in separate tables because they have different
attributes (e.g. runtime for films, seasons and episode counts for series).
Lookup and linking tables prevent duplicate data and keep names consistent.

## How to Run
1. `01_schema_and_data.sql`: creates the tables and loads the sample data
2. `02_queries.sql`: runs the five analysis queries

Requires PostgreSQL (developed in pgAdmin 4 on PostgreSQL 17).

## Queries
1. Which actor appeared most across movies and shows?
2. What are the average IMDb ratings by director?
3. How did box office revenue change across release decades?
4. Which studio earned the highest total profit?
5. How profitable was each movie?

## Data Sources
IMDb, Box Office Mojo, Rotten Tomatoes, and Star Wars Databank.
The three unreleased films are hypothetical entries based on publicly
available announcements and rumors.
