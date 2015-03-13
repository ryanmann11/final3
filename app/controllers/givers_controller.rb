class GiversController < ApplicationController
  skip_before_action :require_user, only: :show

  def index
    @givers = Giver.all
  end

  def show
    @giver = Giver.find_by(id: params["id"])
    @case = Case.find_by(giver_id: @giver.id) 
  end

  def new
    @giver = Giver.new
    @case = Case.all
  end

  def create
    giver_params = params.require(:giver).permit(:name, :email)
    @giver = Giver.create(giver_params)
    @firm = Firm.all
  
    
    # read the uploaded file
    file = params["giver"]["photo"]
    file_data = file.read

    # write the uploaded file to a new file somewhere
    the_file = Rails.root.join("public", "images", "#{@giver.id}.jpg")
    File.open(the_file, "wb") do |f|
      f.write(file_data)
    end
    
    redirect_to new_case_path
  end

  def edit
    @giver = Giver.find_by(id: params["id"])
  end

  def update
    giver_params = params.require(:giver).permit(:name)
    @giver = Giver.find_by(id: params["id"])
    @giver.update(giver_params)
    redirect_to givers_path
  end

  def destroy
    @giver = Giver.find_by(id: params["id"])
    @giver.destroy
    redirect_to givers_path
  end

end