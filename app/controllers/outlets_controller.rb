class OutletsController < ApplicationController
  before_action :set_outlet, only: %i[ show edit update ]

  # GET /outlets or /outlets.json
  def index
    @outlets = Outlet.all.order("last_ordered_at DESC NULLS LAST")
  end

  # GET /outlets/1 or /outlets/1.json
  def show
  end

  # GET /outlets/new
  def new
    @outlet = Outlet.new
  end

  # GET /outlets/1/edit
  def edit
  end

  # POST /outlets or /outlets.json
  def create
    @outlet = Outlet.new(outlet_params)

    respond_to do |format|
      if @outlet.save
        format.html { redirect_to outlets_url(highlight: @outlet.id), notice: "Outlet was successfully created." }
        format.json { render :show, status: :created, location: @outlet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outlets/1 or /outlets/1.json
  def update
    respond_to do |format|
      if @outlet.update(outlet_params)
        format.html { redirect_to outlets_url(highlight: @outlet.id), notice: "Outlet was successfully updated." }
        format.json { render :show, status: :ok, location: @outlet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outlet_params
      params.require(:outlet).permit(:name, :location, :last_ordered_at)
    end
end
