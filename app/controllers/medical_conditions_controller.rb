class MedicalConditionsController < ApplicationController
  before_action :set_medical_condition, only: %i[ show edit update destroy ]

  # GET /medical_conditions or /medical_conditions.json
  def index
    if params[:search].present?
      @medical_conditions = MedicalCondition.search(params[:search]).order(name: :asc).paginate(page: params[:page], per_page: 5)
    else
      @medical_conditions = MedicalCondition.all.order(name: :asc).paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /medical_conditions/1 or /medical_conditions/1.json
  def show
  end

  # GET /medical_conditions/new
  def new
    @medical_condition = MedicalCondition.new
  end

  # GET /medical_conditions/1/edit
  def edit
  end

  # POST /medical_conditions or /medical_conditions.json
  def create
    @medical_condition = MedicalCondition.new(medical_condition_params)

    respond_to do |format|
      if @medical_condition.save
        format.html { redirect_to medical_conditions_path, notice: "Medical condition was successfully created." }
        format.json { render :show, status: :created, location: @medical_condition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_conditions/1 or /medical_conditions/1.json
  def update
    respond_to do |format|
      if @medical_condition.update(medical_condition_params)
        format.html { redirect_to medical_condition_url(@medical_condition), notice: "Medical condition was successfully updated." }
        format.json { render :show, status: :ok, location: @medical_condition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_conditions/1 or /medical_conditions/1.json
  def destroy
    @medical_condition.destroy!

    respond_to do |format|
      format.html { redirect_to medical_conditions_url, notice: "Medical condition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_condition
      @medical_condition = MedicalCondition.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medical_condition_params
      params.require(:medical_condition).permit(:name)
    end
end
