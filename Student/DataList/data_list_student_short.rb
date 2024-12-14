require_relative 'data_list'
require_relative 'data_table'
class DataListStudentShort < DataList
  def get_names
    ["№", "full_name", "git", "contact"]
  end

  def get_data
    index = 1
    result = [self.get_names]
    selected = self.get_selected
    selected.each do |selected_index|
      obj = @data[selected_index]
      raise "Объект с индексом #{selected_index} отсутствует в данных" if obj.nil?
      row = [index, obj.initials, obj.github, obj.contact]
      result.append(row)
      index += 1
    end
    Data_table.new(result)
  end
end