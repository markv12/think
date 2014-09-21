class AssessmentsController < ApplicationController
  def index
    @assessments = current_user.assessments
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def take
    @response = Assessment.find(params[:id]).create_empty_response
  end

  def submit
    @response = AssessmentResponse.new(response_params)
    if @response.save
      flash[:notice] = "Response Successful"
      redirect_to assessments_path
    else
      render :action => :take
    end
  end

  def response_params
    params.require(:assessment_response).permit(answers_attributes:[:id, :question_id, :answer_text])
  end
end
