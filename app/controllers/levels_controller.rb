class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
  end

  def new
    @level = Level.new
  end

  def create
    @level = Level.new(params[:level])
    if @level.save
      redirect_to @level, :notice => "Successfully created level."
    else
      render :action => 'new'
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def update
    @level = Level.find(params[:id])
    if @level.update_attributes(params[:level])
      redirect_to @level, :notice  => "Successfully updated level."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    redirect_to levels_url, :notice => "Successfully destroyed level."
  end
end
