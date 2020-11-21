class ProceduresController < ApplicationController
  def index
    render json: MedicalProcedure.get_ordered_by_query(params[:q]), status: :ok
  end
end
