class PatientlistsController < ApplicationController
  before_action :set_patientlist, only: %i[ show edit update destroy ]
  before_action :set_category_options, only: %i[new create edit update]

  # GET /patientlists or /patientlists.json
  def index
    @patientlists = Patientlist.all
  end

  # GET /patientlists/1 or /patientlists/1.json
  def show
  end

  # GET /patientlists/new
  def new
    @patientlist = Patientlist.new
  end

  # GET /patientlists/1/edit
  def edit
  end

  # POST /patientlists or /patientlists.json
  def create
    @patientlist = Patientlist.new(patientlist_params)

    respond_to do |format|
      if @patientlist.save
        format.html { redirect_to patientlist_url(@patientlist), notice: "Patientlist was successfully created." }
        format.json { render :show, status: :created, location: @patientlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patientlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patientlists/1 or /patientlists/1.json
  def update
    respond_to do |format|
      if @patientlist.update(patientlist_params)
        format.html { redirect_to patientlist_url(@patientlist), notice: "Patientlist was successfully updated." }
        format.json { render :show, status: :ok, location: @patientlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patientlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patientlists/1 or /patientlists/1.json
  def destroy
    @patientlist.destroy

    respond_to do |format|
      format.html { redirect_to patientlists_url, notice: "Patientlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_category_options
      @category_options = Category.all.pluck(:description, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_patientlist
      @patientlist = Patientlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patientlist_params
      params.require(:patientlist).permit(:register_name, :email, :category_id)
    end
end
