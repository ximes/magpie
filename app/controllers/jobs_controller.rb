class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy, :perform, :perform_preview]
  before_action :set_atoms, only: [:edit, :new, :create, :update]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/new
  def new
    @job = Job.new(user: current_user)
  end

  # GET /jobs/1/edit
  def edit
    @job.steps.first_or_create
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    respond_to do |format|
      if @job.save
        format.html { redirect_to edit_job_path(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: jobs_path }
      else
        #raise @job.errors.inspect
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to edit_job_path(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: jobs_path }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def perform
    @job.perform!
    respond_to do |format|
      format.html { redirect_to edit_job_path(@job), notice: "Job was successfully performed." }
      format.json { head :no_content }
    end
  end

  def perform_preview
    result = @job.perform
    respond_to do |format|
      format.html { render json: { result: result[:result], date: result[:updated_at].to_s(:db) }, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def set_atoms
      @atoms = Atom.all.map { |atom| [atom, atom.class_name.constantize.new] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.fetch(:job, {}).permit(:name, :enabled, :start_date, :end_date, :url, :customizable, :user_id, configuration_attributes: [:id, :job_method, :track_job_results, :track_job_status, :notify_job_results, :diff_job_results, :notify_job_status, :preliminary_header_check, :job_notification, :job_notification_method], schedulers_attributes: [:id, :time, :schedule, :enabled, :_destroy])
    end
end
