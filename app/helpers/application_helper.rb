module ApplicationHelper

  attr_accessor :name

  def my_name
    @name = "Chris Kibble"
    @name
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

end
