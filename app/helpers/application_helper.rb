# frozen_string_literal: true

module ApplicationHelper
    def current_year
        "#{Date.today.year}."
    end
    def github_url(author,repo)
        data="#{author}.<a href='https://github.com/#{author}/#{repo}'>#{repo}.</a>"
        data.html_safe
    end
end
