class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #POST /jobs
  def create
    @new_job = Job.create(url: params[:url], employer_name: params[:employer_name], employer_description: params[:employer_description], job_title: params[:job_title], job_description: params[:job_description], year_of_experience: params[:year_of_experience], education_requirement: params[:education_requirement], industry: params[:industry], base_salary: params[:base_salary], employment_type_id: params[:employment_type_id])

    render 'jobs/create.jbuilder'
  end

  #GET /jobs
  def index
    @new_job = Job.all
    render 'jobs/index.jbuilder'
  end

  #GET /jobs/:id
  def show
    @new_job = Job.find_by(id: params[:id])
    render 'jobs/show.jbuilder'
  end
end
