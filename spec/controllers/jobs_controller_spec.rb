require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'post /jobs' do
    it 'create a new job object' do
      post :create, params: { url: 'www.johny.com', employer_name: 'Johny', employer_description: 'Developer', job_title: 'App Developer', job_description: 'Developer of Mobile Apps', year_of_experience: 2, education_requirement: 'Associate Degree', industry: 'IT', base_salary: 1000, employment_type_id: 2000 }
      expect(Job.count).to eq(1)
    end
  end

  describe 'get /jobs' do
    it 'renders all jobs in JSON' do
      job_1 = Job.create(url: 'www.johny.com', employer_name: 'Johny', employer_description: 'Developer', job_title: 'App Developer', job_description: 'Developer of Mobile Apps', year_of_experience: 2, education_requirement: 'Associate Degree', industry: 'IT', base_salary: 1000, employment_type_id: 2000)
      job_2 = Job.create(url: 'www.fan.com', employer_name: 'Fan', employer_description: 'Developer', job_title: 'Web Developer', job_description: 'Developer of Web Apps', year_of_experience: 2, education_requirement: 'Associate Degree', industry: 'IT', base_salary: 1000, employment_type_id: 2003)

      get :index

      expected_response = {
        jobs: [
          {
            id: job_1.id,
            url: job_1.url,
            employer_name: job_1.employer_name,
            employer_description: job_1.employer_description,
            job_title: job_1.job_title,
            job_description: job_1.job_description,
            year_of_experience: job_1.year_of_experience,
            education_requirement: job_1.education_requirement,
            industry: job_1.industry,
            base_salary: job_1.base_salary,
            employment_type_id: job_1.employment_type_id
          }, {
            id: job_2.id,
            url: job_2.url,
            employer_name: job_2.employer_name,
            employer_description: job_2.employer_description,
            job_title: job_2.job_title,
            job_description: job_2.job_description,
            year_of_experience: job_2.year_of_experience,
            education_requirement: job_2.education_requirement,
            industry: job_2.industry,
            base_salary: job_2.base_salary,
            employment_type_id: job_2.employment_type_id
          }
        ]
      }
    end
  end

  describe 'get /jobs/:id' do
    it 'renders specific job by id in JSON' do
      job = Job.create(url: 'www.roni.com', employer_name: 'Roni', employer_description: 'Developer', job_title: 'App Developer', job_description: 'Developer of Mobile Apps', year_of_experience: 2, education_requirement: 'Associate Degree', industry: 'IT', base_salary: 1000, employment_type_id: 1997)

      get :index

      expect(Job.count).to eq(1)

      expected_response = {
        job: {
          id: job.id,
            url: job.url,
            employer_name: job.employer_name,
            employer_description: job.employer_description,
            job_title: job.job_title,
            job_description: job.job_description,
            year_of_experience: job.year_of_experience,
            education_requirement: job.education_requirement,
            industry: job.industry,
            base_salary: job.base_salary,
            employment_type_id: job.employment_type_id
        }
      }
    end
  end
end
