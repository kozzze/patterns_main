class StudentsList

  attr_reader :students
  def initialize(file_path)
      @file_path = file_path
      @students = read_from_file
  end

  def get_student_by_id(id)
    @students.find { |student| student.id == id }
end
def get_k_n_student_short_list(k, n, existing_data_list = nil)
    start_index = (k - 1) * n
    slice = @students[start_index, n] || []
    student_shorts = slice.map { |student| Student_short.from_student(student) }
    
    if existing_data_list
        existing_data_list.replace(student_shorts)
        existing_data_list
    else
        DataListStudentShort.new(student_shorts)
    end
end
def sort_by_surname_fullname!
    @students.sort_by! { |student| student.initials }
end
def add_student(student)
    student_id_list = @students.map { |student| student.id }
    max_id = student_id_list.max || 0
    student.id = max_id + 1
    @students << student
end
def update_student_by_id(id, new_student)
    index = @students.find_index { |student| student.id == id }
    raise IndexError, "wrong id" unless index
    @students[index] = new_student
    new_student.id = id
end
def delete_student_by_id(id)
    @students.reject! { |student| student.id == id }
end
def get_student_short_count
    @students.size
end


end