require 'json'
require_relative '../model/student_short'
require_relative '../model/student'
require_relative '../DataList/data_list'
require_relative '../DataList/data_list_student_short'
require_relative '../DataList/data_table'
require_relative 'student_list_super'

class StudentsListJSON < StudentsList

  def read_from_file
      return [] unless File.exist?(@file_path)
      JSON.parse(File.read(@file_path), symbolize_names: true).map do |student|
        Student.new(**student)
      end
    end
  
  def save_to_file
    to_data_hash = students.map{|student| student.to_h}
    json_data = JSON.pretty_generate(to_data_hash)
    File.write(@file_path, json_data)
  end


end