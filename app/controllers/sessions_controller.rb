# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to return_page
    else
      flash[:alert] = 'Are you a GURU?! Verify your Email and Password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to tests_path
  end
end
