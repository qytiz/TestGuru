# frozen_string_literal: true


class User::SessionsController < Devise::SessionsController
  def create
    super
    if current_user.have_name?
      flash[:login] = "Welcome, #{current_user.first_name} #{current_user.last_name}!"
    end
  end
end
