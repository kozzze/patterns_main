require_relative '../db/student_list_db'

class StudentsListController
  attr_reader :data_list, :students_list
  attr_accessor :view

  def initialize(view)
    @view = view
    begin
      @students_list = StudentListDB.new # Подключаем базу данных
    rescue => e
      raise "Ошибка при загрузке данных: #{e.message}"
    end

    @data_list = DataListStudentShort.new([]) # Инициализируем пустой список
    @data_list.add_observer(@view)
  end

  def refresh_data

    @data_list.data = @students_list.get_k_n_student_short_list(@view.current_page, @view.students_per_page) # Здесь присваиваем преобразованный массив
    @data_list.count = @students_list.count_students_short
    @data_list.offset = (@view.current_page - 1) * @view.students_per_page
    @data_list.notify
  end

  def change_page(page)
    begin
      total_items = @students_list.count_students_short
      total_pages = (total_items.to_f / @view.students_per_page).ceil

      new_page = @view.current_page + page
      return if new_page < 1 || new_page > total_pages

      @view.current_page = new_page
      refresh_data
    rescue => e
      raise "Ошибка при изменении страницы: #{e.message}"
    end
  end
end