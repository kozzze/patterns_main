require_relative 'data_list'
require_relative 'data_table'
class DataListStudentShort < DataList
  def get_names
    ["№", "full_name", "git", "contact"]
  end
  def get_objects_array
    @data.each_with_index.map do |obj, index|
      [index + 1, obj.initials, obj.github, obj.contact]
    end
  end
end