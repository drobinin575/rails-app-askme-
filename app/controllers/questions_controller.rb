class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :destroy, :show, :hide, :update]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question), notice: 'Your question was created.'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Your question was deleted.'
  end

  def edit
  end

  def hide
    @question.update(hidden: true)

    redirect_to question_path(@question), notice: 'Your question is hidden now.'
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Your question was updated.'
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
