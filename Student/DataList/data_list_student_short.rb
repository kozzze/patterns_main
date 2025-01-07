require_relative 'data_list'
require_relative 'data_table'
class DataListStudentShort < DataList
  def column_names
    ["№", "full_name", "git", "contact"]
  end

  def get_objects_array
    result = []
    @data.each_with_index do |obj, index|
      row = [index + 1, obj.initials, obj.github, obj.contact]
      result << row
    end
    DataTable.new(result)
  end
end