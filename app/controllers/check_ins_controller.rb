class CheckInsController < ApplicationController
  def update
    check_in = CheckIn.find_by(id: params[:id])
    if check_in
      check_in.status = params[:check_in][:status] == "1"
      check_in.save
      # redirect_to project_path(params[:project_id])
      head :ok
    end
  end
end
