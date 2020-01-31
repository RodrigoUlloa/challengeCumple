class QuotesController < ApplicationController
  def index

  end

  def result
    @dollar_info = Dollar.new.from_to(*from_to) if dollar?
    @uf_info = UF.new.from_to(*from_to) if uf?
    @tmv_info = TMC.new.from_to(*from_to)
  end


  private
  def quote_params
    params.require(:quote).permit(:from, :to, :dollar, :uf)
  end

  def from_to
    [Date.parse(quote_params[:from]), Date.parse(quote_params[:to])]
  end

  def dollar?
    quote_params[:dollar] == '1' ? true : false
  end

  def uf?
    quote_params[:uf] == '1' ? true : false
  end

end
