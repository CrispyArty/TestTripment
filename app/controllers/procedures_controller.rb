class ProceduresController < ApplicationController
  def index
    procedure = MedicalProcedure.all
    render json: procedure, status: :ok
  end
end
