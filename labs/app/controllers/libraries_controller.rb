# frozen_string_literal: true

# Controls the behavior for managing libraries.
class LibrariesController < ApplicationController
  before_action :set_library, only: %i[show edit update destroy]

  def index
    @user = current_user
    @libraries = Library.all.page(params[:page]).per(10)
  end

  def show; end

  def new
    @library = Library.new
  end

  def edit; end

  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: t('notices.library_created') }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to @library, notice: t('notices.library_updated') }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @library = Library.find(params[:id])
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_path, notice: t('notices.library_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def library_params
    params.require(:library).permit(:name, :address)
  end
end
