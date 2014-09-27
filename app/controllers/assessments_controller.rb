class AssessmentsController < ApplicationController
  def index
    @assessments = current_user.assessments
  end

  def show
    @assessment = Assessment.find(params[:id])
  end

  def take
    @response = Assessment.find(params[:id]).create_empty_response
    @response.user = current_user
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

  def update
    @response = AssessmentResponse.find(params[:id])
    respond_to do |format|
      if @response.update(response_params)
        format.js { render "assessments/update", :locals => {response: @response}}
      else
        format.js { render "assessments/update", :locals => {response: @response}}
      end
    end
  end

  def add_question
    @assessment = Assessment.find(params[:id])
    @daily_response = @assessment.todays_response
    @question = Question.new(question_params)
    @question.assessment = @assessment
    respond_to do |format|
      if(@question.save)
        @daily_response.update_to_reflect_assessment
        format.js { render inline: "location.reload();" }
      else
        format.js { render inline: "location.reload();" }
      end
    end
  end

  def response_params
    params.require(:assessment_response).permit(:user_id, :assessment_id ,answers_attributes:[:id, :question_id, :answer_text])
  end

    def question_params
    params.require(:question).permit(:question_type, :question_text, :scale_min, :scale_max)
  end
end
