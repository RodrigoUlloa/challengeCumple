class QuotesController < ApplicationController
  def show
  end

  private
  def quote_params
    params.require(:quote).permit(:from, :to)
  end

end
