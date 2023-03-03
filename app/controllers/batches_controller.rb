class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy ]

  # GET /batches or /batches.json
  def index
    if(params[:material_id])
      @q = Batch.includes(:material, :supplier,  material: [:category]).where(:material_id, params[:material_id]).ransack(params[:q])
      @batches = @q.result
    else
      @q = Batch.includes(:material, :supplier,  material: [:category]).ransack(params[:q])
      @batches = @q.result
    end
  end

  # GET /batches/1 or /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @material = Material.includes(:category).find(params[:material_id])
    @batch = Batch.new
    @next_batchId = "#{Batch.maximum(:batchId).to_i + 1}".rjust(6, "0")
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      @batch = Batch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:material_id, :batchId, :document, :heat, :supplier_id, :quantity)
    end
end
