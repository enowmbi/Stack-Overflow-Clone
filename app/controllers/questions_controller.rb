class sController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
    def index
      @questions = Question.all
      @answers = Answer.all
      @users = User.all
    end

    def new
      @user = User.find(params[:user_id])
      @question = Question.new
    end

    def show
      @question = Question.find(params[:id])
    end

    def edit
      @question = Question.find(params[:id])
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        flash[:notice] = "Posted Sucessfully!!"
        redirect_to questions_path
      else
        render :new
      end
    end

    def destroy
      @question = Question.find(params[:id])
      @question.destroy
      flash[:notice] = "Smell you later, question."
      redirect_to questions_path
    end

    def update
      @question = Question.find(params[:id])
      if @question.update(params[:question])
        redirect_to questions_path
      else
        render :edit
      end
    end

  private

    def question_params
      params.require(:question).permit(:description, :user_id)
    end
  end
