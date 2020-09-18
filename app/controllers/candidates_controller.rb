class CandidatesController < ApplicationController
  def index
      @candidate = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    
    @candidate = Candidate.new(clean_params)
    
    if @candidate.save
      flash[:notice] = 'Candidate created!! yay'
      redirect_to '/candidates'
    else
      render :new
    end
  end

  private
  def clean_params
    clean_params = params.require(:candidate).permit(:name, :age, :party, :politics)
  end
end