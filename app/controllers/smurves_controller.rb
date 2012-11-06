class SmurvesController < ApplicationController
  # GET /smurves
  # GET /smurves.json
  def index
    @smurves = Smurf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @smurves }
    end
  end

  # GET /smurves/1
  # GET /smurves/1.json
  def show
    @smurf = Smurf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smurf }
    end
  end

  # GET /smurves/new
  # GET /smurves/new.json
  def new
    @smurf = Smurf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smurf }
    end
  end

  # GET /smurves/1/edit
  def edit
    @smurf = Smurf.find(params[:id])
  end

  # POST /smurves
  # POST /smurves.json
  def create
    @smurf = Smurf.new(params[:smurf])

    respond_to do |format|
      if @smurf.save
        format.html { redirect_to @smurf, notice: 'Smurf was successfully created.' }
        format.json { render json: @smurf, status: :created, location: @smurf }
      else
        format.html { render action: "new" }
        format.json { render json: @smurf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /smurves/1
  # PUT /smurves/1.json
  def update
    @smurf = Smurf.find(params[:id])

    respond_to do |format|
      if @smurf.update_attributes(params[:smurf])
        format.html { redirect_to @smurf, notice: 'Smurf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smurf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smurves/1
  # DELETE /smurves/1.json
  def destroy
    @smurf = Smurf.find(params[:id])
    @smurf.destroy

    respond_to do |format|
      format.html { redirect_to smurves_url }
      format.json { head :no_content }
    end
  end
end
