class StartsController < ApplicationController
#  before_action :set_start, only: [:show, :edit, :update, :destroy]

  def reload_linktable
    Transfert.destroy_all
    Transfert.load_linktable_from_csv_file('db/budget_koatu_link.csv')
  end

  
  def attach_transfert_values
    @affected_rows = Transfert.attach_transfert_values('db/budget.csv')
  end

  def load_areas1_from_json_file
    Area.destroy_all
    Area.load_areas1_from_json_file('db/oblasti_json1.txt')
    Area.cleanup1_from_file
    @areas = Area.all
  end

  def load_areas2_from_json_file
    Area.destroy_all
    Area.load_areas2_from_json_file('db/oblasti_json2.txt')
    #Area.cleanup2_from_file
    @areas = Area.all
  end


  def populate_fake_data
    params[:levels].each do |level|
      
    end






    logger.debug params
    render nothing: true
  end


  def build_links_to_area
    @transferts = Transfert.all
    @transferts.each do |t|
      t.build_link_to_area
    end
  end



  # GET /starts
  # GET /starts.json
  def index
    @starts = Start.all
  end

  # GET /starts/1
  # GET /starts/1.json
  def show
  end

  # GET /starts/new
  def new
    @start = Start.new
  end

  # GET /starts/1/edit
  def edit
  end

  # POST /starts
  # POST /starts.json
  def create
    @start = Start.new(start_params)

    respond_to do |format|
      if @start.save
        format.html { redirect_to @start, notice: 'Start was successfully created.' }
        format.json { render :show, status: :created, location: @start }
      else
        format.html { render :new }
        format.json { render json: @start.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starts/1
  # PATCH/PUT /starts/1.json
  def update
    respond_to do |format|
      if @start.update(start_params)
        format.html { redirect_to @start, notice: 'Start was successfully updated.' }
        format.json { render :show, status: :ok, location: @start }
      else
        format.html { render :edit }
        format.json { render json: @start.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starts/1
  # DELETE /starts/1.json
  def destroy
    @start.destroy
    respond_to do |format|
      format.html { redirect_to starts_url, notice: 'Start was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_start
      @start = Start.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def start_params
      params.fetch(:start, {})
    end
end
