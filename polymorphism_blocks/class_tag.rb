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
    @children << tag if tag.is_a?(Tag)
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
      "#{spaces}#{open_tag}/>"
    else 
      result = "#{spaces}#{open_tag}\n"
      result += "#{spaces} #{content}\n" if content
      children.each { |child| result += child.to_s(space + 1) }
      result += "#{spaces}#{close_tag}\n"
      result
    end 
  end
  def attributes_string
    attributes.map { |key,value| " #{key} = '#{value}'"}.join
  end
end 

"""
root = Tag.new(tag: 'html')

head = Tag.new(tag: 'head')
body = Tag.new(tag: 'body', attributes: { class: 'main' })

title = Tag.new(tag: 'title', content: 'Сайт')
head.add_child(title)

paragraph = Tag.new(tag: 'p', content: 'Всем прив!')
body.add_child(paragraph)

root.add_child(head)
root.add_child(body)

puts root.to_s
"""