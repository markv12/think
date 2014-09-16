class AssessmentsController < ApplicationController
  def index
    @assessments = current_user.assessments
  end
end
