class FoodJournalsController < ApplicationController
  before_action :set_food_journal, only: %i[ show edit update ]

  # GET /food_journals or /food_journals.json
  def index
    @food_journals = FoodJournal.all.order(date: :desc, time: :desc)
  end

  # GET /food_journals/1 or /food_journals/1.json
  def show
  end

  # GET /food_journals/new
  def new
    @food_journal = FoodJournal.new
  end

  # GET /food_journals/1/edit
  def edit
  end

  # POST /food_journals or /food_journals.json
  def create
    @food_journal = FoodJournal.new(food_journal_params)

    respond_to do |format|
      if @food_journal.save
        format.html { redirect_to food_journals_url(highlight: @food_journal.id), notice: "Food journal was successfully created." }
        format.json { render :show, status: :created, location: @food_journal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_journals/1 or /food_journals/1.json
  def update
    respond_to do |format|
      if @food_journal.update(food_journal_params)
        format.html { redirect_to food_journals_url(highlight: @food_journal.id), notice: "Food journal was successfully updated." }
        format.json { render :show, status: :ok, location: @food_journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_journal
      @food_journal = FoodJournal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_journal_params
      params.require(:food_journal).permit(:date, :time, dish_ids: [])
    end
end
