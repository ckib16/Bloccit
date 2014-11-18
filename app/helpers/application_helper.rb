module ApplicationHelper

  attr_accessor :name

  def my_name
    @name = "Chris Kibble"
    @name
  end

end
