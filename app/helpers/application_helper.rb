module ApplicationHelper

  attr_accessor :name, :class_display

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

  # def form_group_string(errors)
  #   if errors.any?
  #     @class_display = 'form-group has-error'
  #   else
  #     @class_display = 'form-group'
  #   end
  # end



end
