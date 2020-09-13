# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
require_relative "todo.rb"

class TodoList

  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.is_a? Todo
    @todos << todo
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each(&:done!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.fetch(index)
    @todos.delete_at(index)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each(&block)
    @todos.each { |item| yield(item) }
    self
  end

  def select(&block)
    obj = TodoList.new(title)
    @todos.each { |item| obj.add(item) if yield(item) }
    obj
  end

  def find_by_title(string)
    raise TypeError, "Argument must be string" unless string.is_a? String
    @todos.each { |item| return item if item.title == string }
    nil
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(string)
    raise TypeError, "Argument must be string" unless string.is_a? String
    find_by_title(string) && find_by_title(string).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

 list.each do |todo|
   puts todo                   # calls Todo#to_s
 end

p list.find_by_title("Buy milk")