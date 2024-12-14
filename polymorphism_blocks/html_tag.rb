class HTMLTag
  attr_reader :tag, :attributes, :children
  attr_accessor :content

  def initialize(tag:, attributes: {}, content: nil)
    @tag = tag
    @attributes = attributes
    @content = content
    @children = []
  end

  def add_child(tag)
    @children << tag if tag.is_a?(HTMLTag) 
  end

  def name
    @tag
  end
  
  def count_children
    children.size
  end

  def has_children?
    !children.empty?
  end

  def to_s(space = 0)
    spaces = '  ' * space
    open_tag = "<#{tag}#{attributes_string}>"
    close_tag = "</#{tag}>"

    if content.nil? && children.empty?
      "#{spaces}<#{tag}#{attributes_string} />"
    else
      result = "#{spaces}#{open_tag}\n"
      result += "#{spaces}  #{content}\n" if content
      children.each { |child| result += child.to_s(space + 1) }
      result += "#{spaces}#{close_tag}\n"
      result
    end
  end

  def attributes_string
    attributes.map { |key, value| " #{key}='#{value}'" }.join
  end
end
