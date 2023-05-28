# frozen_string_literal: true

# Controls the behavior for managing reader cards.
class ReaderCardsController < ApplicationController
  before_action :set_reader_card, only: %i[show edit update destroy]

  def index
    @reader_cards = ReaderCard.all.page(params[:page]).per(10)
  end

  def show; end

  def new
    @reader_card = ReaderCard.new
  end

  def edit; end

  def create
    @reader_card = ReaderCard.new(reader_card_params)

    respond_to do |format|
      if @reader_card.save
        format.html { redirect_to @reader_card, notice: t('notices.reader_card_created') }
        format.json { render :show, status: :created, location: @reader_card }
      else
        format.html { render :new }
        format.json { render json: @reader_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reader_card.update(reader_card_params)
        format.html { redirect_to @reader_card, notice: t('notices.reader_card_updated') }
        format.json { render :show, status: :ok, location: @reader_card }
      else
        format.html { render :edit }
        format.json { render json: @reader_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reader_card = ReaderCard.find(params[:id])
    @reader_card.destroy
    respond_to do |format|
      format.html { redirect_to reader_cards_path, notice: t('notices.reader_card_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  def set_reader_card
    @reader_card = ReaderCard.find(params[:id])
  end

  def reader_card_params
    params.require(:reader_card).permit(:number, :library_id)
  end
end
