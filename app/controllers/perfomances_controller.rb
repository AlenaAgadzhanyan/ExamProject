class PerfomancesController < ApplicationController
  before_action :set_perfomance, only: [ :show, :edit, :update, :destroy ]

  def index
    @perfomances = Perfomance.all
  end

  def new
    @perfomance = Perfomance.new
  end

  def show
    @sessions = @perfomance.sessions
    @reviews = @perfomance.reviews
  end

  def create
    @perfomance = Perfomance.new(perfomance_params)

    if @perfomance.save
      redirect_to perfomances_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @perfomance.update(perfomance_params)
      redirect_to @perfomance
    else
      render :edit
    end
  end

  def destroy
    @perfomance.destroy
    redirect_to perfomances_path
  end

  private

  def set_perfomance
    @perfomance = Perfomance.find(params[:id])
  end

  def perfomance_params
    params.require(:perfomance).permit(:title, :duration, :age_rating, :release_date)
  end
end
