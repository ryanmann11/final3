class CasesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find_by(id: params["id"])
    @giver = @case.giver
  end

  def edit
    @case = Case.find_by(id: params["id"])
  end

  def new
    @case = Case.new
  end

  def create
    case_params = params.require(:case).permit(:name, :firm_id, :summary, :difficulty, :topic)
    @case = Case.new(case_params)
    @case.giver = Giver.create(:name=>current_user.name)
    @case.image = "Stock.jpg"
    if @case.save
    redirect_to cases_path
  else 
    render "new"
end
end

  def update
    case_params = params.require(:case).permit!
    @case = Case.find_by(id: params["id"])
    @case.update(case_params)
    if @case.valid?
      redirect_to cases_path
    else
      render text: "Uh oh! Problemo! Try again, please!"
    end
  end

  def destroy
    @case = Case.find_by(id: params["id"])
    @case.destroy
    redirect_to cases_path
  end
end

