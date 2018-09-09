-- Write a query to drop a database named 'todo_app' if it exists
DROP DATABASE todo_app;

-- Write a query to delete a user named 'michael' if it exists
DROP ROLE michael;

-- Write a query to create a user named 'michael' with an encrypted password 'stonebreaker'
CREATE ROLE michael 
    WITH ENCRYPTED PASSWORD 'stonebreaker';

-- Write a query to create a database named 'todo_app' 
CREATE DATABASE todo_app;

-- Write a query to create a table named 'tasks' using the Initial Columns detailed below: 
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL,
    description TEXT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL, 
    completed  BOOLEAN NOT NULL DEFAULT false
);

-- Remove the column named 'completed'
ALTER TABLE tasks 
    DROP COLUMN completed;

-- Add a column to 'tasks' named 'completed_at': timestamp, that may be NULL and has a default value of 'NULL'
ALTER TABLE tasks  
    ADD COLUMN completed_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL;

-- Change the 'updated_at' column to not allow NULL values, and have the default of 'now()'
ALTER TABLE tasks 
    ALTER COLUMN updated_at SET NOT NULL, 
    ALTER COLUMN updated_at SET DEFAULT now();

-- Create a new task, by only setting values (not defining which columns)
INSERT INTO tasks VALUES (default, 'Study SQL', 'Completed this exercise', now(), now(), NULL);

-- Create a new task
-- 'title = Study PostgresSQL'
-- 'description = REad all the documentation'
INSERT INTO tasks (title, description) VALUES ('Study PostgresSQL', 'Read all the documentation');

-- Select all the titles of tasks that are not yet completed 
SELECT title 
    FROM tasks 
    WHERE completed_at IS NULL;

-- Update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks 
    SET completed_at = now()
    WHERE title = 'Study SQL';

-- Select all titles and descriptions of tasks that are not yet completed 
SELECT title, description 
    FROM tasks 
    WHERE completed_at IS NULL;

-- Select all fields of every task sorted by creation data in descending order 
SELECT *
    FROM tasks
    ORDER BY created_at DESC;

-- Create a new task 
-- 'title = mistake 1'
-- 'description = a test entry'
INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

-- Create a new task 
-- 'title = mistake 2'
-- 'description = another test entry'
INSERT INTO tasks (title, description) VALUES ('mistake 2', 'a test entry');

-- Create a new task 
-- 'title = third mistake'
-- 'description = another test entry'

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

-- Select title fields of all tasks with a title that includes the word 'mistake'
SELECT title 
    FROM tasks 
    WHERE title LIKE '%mistake%';

-- Delete the task that has a title of 'mistake 1'
DELETE FROM tasks 
    WHERE title = 'mistake 1';

-- Select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description
    FROM tasks
    WHERE title LIKE '%mistake%';

-- Delete all tasks that includes the word 'mistake' in the title
DELETE FROM tasks 
    WHERE title LIKE '%mistake%';

-- Select all fields of all tasks sorted by 'title' in ascending order 
SELECT * 
    FROM tasks 
    ORDER BY title;


