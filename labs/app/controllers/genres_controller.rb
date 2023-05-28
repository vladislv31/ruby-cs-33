# frozen_string_literal: true

# Controls the behavior for managing genres.
class GenresController < ApplicationController
  before_action :set_genre, only: %i[show edit update destroy]

  def index
    @genres = Genre.all.page(params[:page]).per(10)
  end

  def show; end

  def new
    @genre = Genre.new
  end

  def edit; end

  def create
    @genre = Genre.new(genre_params)
    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: t('notices.genre_created') }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: t('notices.genre_updated') }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: t('notices.genre_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name, :description)
  end
end
