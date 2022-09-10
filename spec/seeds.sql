TRUNCATE TABLE cohorts, students RESTART IDENTITY;

INSERT INTO cohorts (name, starting_date) VALUES 
  ('Jan', '2000-01-01'),
  ('Feb', '2001-02-02');

INSERT INTO students (name, cohort_id) VALUES 
  ('Yichao', 1),
  ('Xinrui', 1),
  ('Kiki', 2);

--print out the data of one cohort with its students to the terminal.
-- SELECT cohorts.name, cohorts.starting_date, students.name
--   FROM cohorts
--     JOIN students ON cohorts.id = students.cohort_id
--   WHERE cohorts.id = $1; 