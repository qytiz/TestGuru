# frozen_string_literal: true

module SessionsHelper
  def flash_message(type)
    content_tag :p, flash[type], class: 'flash ' if flash[type]
  end
end
