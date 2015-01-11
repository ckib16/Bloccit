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

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def up_vote_link_classes(post)
    class_start = "glyphicon glyphicon-chevron-up "
    if current_user.voted(post) && current_user.voted(post).up_vote?
      class_start + 'voted'
    else
      class_start + ''
    end
  end

  def down_vote_link_classes(post)
    class_start = "glyphicon glyphicon-cheveron-down "
    if current_user.voted(post) && current_user.voted(post).down_vote?
      class_start + 'voted'
    else
      class_start + ''
    end
  end

end
