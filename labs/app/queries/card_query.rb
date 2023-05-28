# frozen_string_literal: true

# This class represents an reader card query that can be used to search for reader cards.
class CardQuery
  def initialize(params)
    @params = params
  end

  def results
    cards = ReaderCard.all

    cards = cards.where(number: @params[:number]) if @params[:number].present?

    if @params[:params] && @params[:params][:library_id].present?
      cards = cards.where(library_id: @params[:params][:library_id])
    end

    cards.order(@params[:sort])
  end
end
