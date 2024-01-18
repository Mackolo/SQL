# SQL
My projects in sql language

Football League Management System

Overview
This project is a Football League Management System that helps organize and manage information related to football leagues, teams, players, matches, and their associated statistics. The system includes a database schema, sample data, and SQL scripts for creating tables, inserting values, and defining foreign keys. Additionally, stored procedures and triggers are implemented to perform specific actions, such as retrieving player statistics based on the team and updating player stats after a match.

Database Schema
The system includes the following tables:

League: Contains information about football leagues.
Team: Stores details about football teams, including their country and foundation date.
Player: Manages player information such as name, nationality, position, and team affiliation.
PStats: Tracks player statistics like goals, assists, yellow cards, and red cards.
Pincome: Handles player income details, including salary and bonus.
Match: Records information about football matches, including date, participating teams, and goal details.
Schedule: Manages the schedule of matches.
SQL Scripts
The SQL scripts provided include commands for creating tables, defining primary keys, foreign keys, and inserting sample data into the database. There are also SELECT statements to showcase the data stored in each table.

Stored Procedures
GetPlayerStats: This stored procedure takes a team name as a parameter and retrieves the statistics of players belonging to that team. It uses a cursor to iterate through player statistics and prints relevant information.
Triggers
UpdatePlayerStats: Triggered after inserting a new match record, this trigger updates player statistics based on the goals scored in the match. The goals are evenly distributed among the players of the respective teams.

CheckSalaryBonus: Triggered before inserting a new player income record, this trigger checks if the player's salary is greater than the bonus. If so, it rolls back the transaction and raises an error.

