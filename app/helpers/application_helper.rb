# frozen_string_literal: true

module ApplicationHelper
    def current_year
        Time.current.year
    end
    def github_url(author,repo)
        data="#{author}."
        data+= link_to repo,"https://github.com/#{author}/#{repo}"
    end
end
