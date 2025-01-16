require 'yaml'
require_relative '../model/student_short'
require_relative '../model/student'
require_relative '../DataList/data_list'
require_relative '../DataList/data_list_student_short'
require_relative '../DataList/data_table'
require_relative 'student_list_super'
class StudentsListYAML < StrategySave

    def read_from_file(file_path)
        return [] unless File.exist?(file_path)
        YAML.load(File.read(file_path), symbolize_names: true).map do |student|
          Student.new(**student)
        end
    end
    def save_to_file(file_path,students)
        to_data_hash = students.map { |student| student.to_h }
        yaml_data = YAML.dump(to_data_hash)
        File.write(file_path, yaml_data)
    end
    
end