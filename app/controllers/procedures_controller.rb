# frozen_string_literal: true

class ProceduresController < ApplicationController
  def index
    query = params[:q]
    if query.is_a?(String)
      render json: MedicalProcedure.filtered(query).sorted(query).all, status: :ok
    else
      render json: MedicalProcedure.all, status: :ok
    end
  end
end
