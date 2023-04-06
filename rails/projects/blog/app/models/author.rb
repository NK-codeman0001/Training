module BookExtension
  def validbooks
      where.not(name: nil)
  end
end

class Author < ApplicationRecord
  # has_many :books
  # has_many :books, validate: true
  has_many :books, extend: BookExtension, before_add: :before_add_func
  # , before_remove: :before_remove_func, after_add: [:after_add_func, :after_add_func_2], after_remove: :after_remove_func

  def before_add_func(book)
    puts "===before+++Add+++Association+++Callback==="
    book.published_at = Time.now
  end
  def after_add_func(book)
    puts "===After+++Add+++Association+++Callback==="
  end
  def after_add_func_2(book)
    puts "===After+++Add+++Association+++Callback+++2==="
  end
  def before_remove_func(book)
    puts "===before+++Remove+++Association+++Callback==="
  end
  def after_remove_func(book)
    puts "===After+++Remove+++Association+++Callback==="
  end
end
