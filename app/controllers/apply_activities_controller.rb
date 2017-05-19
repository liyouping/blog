class ApplyActivitiesController < ApplicationController
  before_action :set_apply_activity, only: [:show, :edit, :update, :destroy]

  # GET /apply_activities
  # GET /apply_activities.json
  def index
    @apply_activities = ApplyActivity.all
  end

  # GET /apply_activities/1
  # GET /apply_activities/1.json
  def show
  end

  # GET /apply_activities/new
  def new
    @apply_activity = ApplyActivity.new
  end

  # GET /apply_activities/1/edit
  def edit
  end

  # POST /apply_activities
  # POST /apply_activities.json
  def create
    @apply_activity = ApplyActivity.new(apply_activity_params)

    respond_to do |format|
      if @apply_activity.save
        format.html { redirect_to @apply_activity, notice: 'Apply activity was successfully created.' }
        format.json { render :show, status: :created, location: @apply_activity }
      else
        format.html { render :new }
        format.json { render json: @apply_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_activities/1
  # PATCH/PUT /apply_activities/1.json
  def update
    respond_to do |format|
      if @apply_activity.update(apply_activity_params)
        format.html { redirect_to @apply_activity, notice: 'Apply activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @apply_activity }
      else
        format.html { render :edit }
        format.json { render json: @apply_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_activities/1
  # DELETE /apply_activities/1.json
  def destroy
    @apply_activity.destroy
    respond_to do |format|
      format.html { redirect_to apply_activities_url, notice: 'Apply activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_activity
      @apply_activity = ApplyActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_activity_params
      params.require(:apply_activity).permit(:open_id, :activity_id)
    end
end
