require_relative 'cohort'
require_relative 'student'

class CohortRepository
  def find_with_students(id)
    sql = "SELECT cohorts.name AS cohort_name, cohorts.starting_date, students.name AS student_name
    FROM cohorts
      JOIN students ON cohorts.id = students.cohort_id
    WHERE cohorts.id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    
    cohort = Cohort.new
    cohort.name = result[0]['cohort_name']
    cohort.starting_date = result[0]['starting_date']

    result.each do |record|
      student = Student.new
      student.name = record['student_name']
      cohort.students << student
    end

    return_value = [cohort.name, cohort.starting_date, cohort.students]
  end
end