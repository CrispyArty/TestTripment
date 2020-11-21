# frozen_string_literal: true

class ProceduresController < ApplicationController
  def index
    render json: MedicalProcedure.filtered(params[:q]).sorted(params[:q]), status: :ok
  end
end
