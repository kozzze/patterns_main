require 'fox16'
require_relative '../db/student_list_db'
include Fox

class StudentApp < FXMainWindow
  def initialize(app)
    super(app, "Students", width: 1503, height: 600)
    @student_db = StudentListDB.new()
    @current_page = 1
    @items_per_page = 10

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    tab1 = FXTabItem.new(tab_book,"Student List View",nil)
    tab1_frame = FXHorizontalFrame.new(tab_book,LAYOUT_FILL_X | LAYOUT_FILL_Y)

    tab2 = FXTabItem.new(tab_book, "2")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end

    tab3 = FXTabItem.new(tab_book, "3")
    FXVerticalFrame.new(tab_book, LAYOUT_FILL).tap do |frame|
      FXLabel.new(frame, nil, nil, LAYOUT_CENTER_X)
    end

    filter_frame = FXVerticalFrame.new(tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 170)
    FXLabel.new(filter_frame, "ФИО:")
    @name_field = FXTextField.new(filter_frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)

    def create_filter_section(frame, label_text)
      section_frame = FXVerticalFrame.new(frame, FRAME_SUNKEN | LAYOUT_FILL_X)
      FXLabel.new(section_frame, label_text)
      combo = FXComboBox.new(section_frame, 3, nil, 0, COMBOBOX_STATIC | LAYOUT_FILL_X)
      combo.numVisible = 3
      combo.appendItem("да")
      combo.appendItem("нет")
      combo.appendItem("не важно")
      combo.setCurrentItem(2)
      input_field = FXTextField.new(section_frame, 25, nil, 0, TEXTFIELD_NORMAL | LAYOUT_FILL_X)
      input_field.enabled = false
      combo.connect(SEL_COMMAND) do
        if combo.currentItem == 0
          input_field.enabled = true
        else
          input_field.enabled = false
          input_field.text = ""
        end
      end
    end

    create_filter_section(filter_frame, "github:")
    create_filter_section(filter_frame, "email:")
    create_filter_section(filter_frame, "phone:")
    create_filter_section(filter_frame, "telegram:")
    table_frame = FXVerticalFrame.new(tab1_frame, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @student_table = FXTable.new(table_frame, nil, 0, TABLE_READONLY | LAYOUT_FILL | TABLE_NO_COLSELECT | TABLE_NO_ROWSELECT)

    controls = FXHorizontalFrame.new(table_frame, opts:LAYOUT_CENTER_X)
    prev_button = FXButton.new(controls, "пред.")
    @page_label = FXLabel.new(controls, "стр: 1/1", nil, JUSTIFY_CENTER_X)
    next_button = FXButton.new(controls, "след.")

    prev_button.connect(SEL_COMMAND) { change_page(-1) }
    next_button.connect(SEL_COMMAND) { change_page(1) }
    control_frame = FXVerticalFrame.new(tab1_frame, FRAME_SUNKEN | LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 200)
    FXButton.new(control_frame, "Add Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)
    FXButton.new(control_frame, "Edit Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)
    FXButton.new(control_frame, "Delete Student", nil, nil, 0, BUTTON_NORMAL | LAYOUT_CENTER_X)
    self.connect(SEL_CLOSE) do
      app.exit
    end
    load_from_db
  end
  private def set_column_widths
    @student_table.setColumnWidth(0, 50)
    @student_table.setColumnWidth(1, 100)
    @student_table.setColumnWidth(2, 220)
    @student_table.setColumnWidth(3, 130)
  end
  private def load_from_db
    total_students = @student_db.count_students_short
    total_pages = (total_students.to_f / @items_per_page).ceil
    @page_label.text = "стр: #{@current_page}/#{total_pages}"
    data_list = DataListStudentShort.new(@student_db.get_k_n_student_short_list(@current_page, @items_per_page))
    data_table = data_list.get_data
    column_names = ["ID", "ФИО", "GitHub", "Контакт"]
    @student_table.setTableSize(data_table.row_count, data_table.col_count)
    column_names.each_with_index do |name, index|
      @student_table.setColumnText(index, name)
    end
    (0...data_table.row_count).each do |row_index|
      (0...data_table.col_count).each do |col_index|
        value = data_table.get_element(row_index, col_index).to_s
        @student_table.setItemText(row_index, col_index, value)
      end
    end

    set_column_widths
  end
  def change_page(page)
    total_students = @student_db.count_students_short
    total_pages = (total_students.to_f / @items_per_page).ceil
    new_page = @current_page + page
    return if new_page < 1 || new_page > total_pages
    @current_page = new_page
    load_from_db
  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end
end


