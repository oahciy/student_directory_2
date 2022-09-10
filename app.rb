require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('student_directory_2')

cohort_repository = CohortRepository.new
result = cohort_repository.find_with_students(1)

cohort = result[0]
starting_date = result[1]
student_1 = result.last[0].name
student_2 = result.last[1].name

p "#{cohort} - #{starting_date} - #{student_1}"
p "#{cohort} - #{starting_date} - #{student_2}"