require_relative 'data_list'
require_relative 'data_table'
class DataListStudentShort < DataList
  def get_names
    ["№", "full_name", "git", "contact"]
  end

  def get_data
    result = []
    @data.each_with_index do |obj, index|
      row = [index + 1, obj.initials, obj.github, obj.contact]
      result << row
    end
    DataTable.new(result)
  end
end