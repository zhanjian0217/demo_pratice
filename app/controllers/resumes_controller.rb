class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      redirect_to root_path, notice: "履歷新增成功"
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to root_path, notice: "履歷更新成功"
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to root_path, notice: "刪除成功" 
  end

  private
    def resume_params
      params.require(:resume).permit(:title, :content, :status)
    end

    def find_resume
      @resume = Resume.find(params[:id])
    end
end
