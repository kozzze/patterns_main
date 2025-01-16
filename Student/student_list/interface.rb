class StrategySave
  def read_from_file(file_path)
    raise NotImplementedError, "Метод должен быть реализован в наследнике"
  end

  def save_to_file(file_path, students)
    raise NotImplementedError, "Метод должен быть реализован в наследнике"
  end
end