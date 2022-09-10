require 'cohort_repository'

RSpec.describe CohortRepository do
  def reset_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_table
  end

  it 'finds cohort 1 with related students' do
    repo = CohortRepository.new
    result = repo.find_with_students(1)
    expect(result[0]).to eq 'Jan'
    expect(result[1]).to eq '2000-01-01'
    expect(result.last[0].name).to eq 'Yichao'
    expect(result.last[1].name).to eq 'Xinrui'
  end
end