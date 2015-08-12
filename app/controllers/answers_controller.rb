class AnswersController < ApplicationController
    def index
      @answer = Answer.all
    end

    def new
      @question = Question.find(params[:question_id])
      @answer = Answer.new
    end

    def create
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new(answer_params)
        if @answer.save
          respond_to do |format|
            format.html do
              flash[:notice] = "Answer Posted"
              redirect_to questions_path(@question)
            end
            format.js
          end
        else
          respond_to do |format|
            format.html do
          flash[:notice] = "Error in answer submission."
          render :new
        end
        format.js
        end
      end
    end

    def edit
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
      @answer.destroy
      flash[:notice] = "Your answer has been removed."
      redirect_to question_path(@question)
    end

    def update
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
      if @answer.update(params[:answer])
        redirect_to question_path(@question)
      else
        render :edit
      end
    end

    def answer_params
      params.require(:answer).permit(:description, :user_id, :question_id)
    end
  end
