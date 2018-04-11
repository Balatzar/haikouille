class HaikouillesController < ApplicationController
  before_action :set_haikouille, only: [:show, :edit, :update, :destroy]

  # GET /haikouilles
  # GET /haikouilles.json
  def index
    @haikouilles = Haikouille.all.order("created_at desc")
  end

  # GET /haikouilles/1
  # GET /haikouilles/1.json
  def show
  end

  # GET /haikouilles/new
  def new
    @haikouille = Haikouille.new
  end

  # GET /haikouilles/1/edit
  def edit
  end

  # POST /haikouilles
  # POST /haikouilles.json
  def create
    @haikouille = Haikouille.new(haikouille_params)

    respond_to do |format|
      if @haikouille.save
        format.html { redirect_to @haikouille }
        format.json { render :show, status: :created, location: @haikouille }
      else
        format.html { render :new }
        format.json { render json: @haikouille.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /haikouilles/1
  # PATCH/PUT /haikouilles/1.json
  def update
    respond_to do |format|
      if @haikouille.update(haikouille_params)
        format.html { redirect_to @haikouille, notice: 'Haikouille was successfully updated.' }
        format.json { render :show, status: :ok, location: @haikouille }
      else
        format.html { render :edit }
        format.json { render json: @haikouille.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /haikouilles/1
  # DELETE /haikouilles/1.json
  def destroy
    @haikouille.destroy
    respond_to do |format|
      format.html { redirect_to haikouilles_url, notice: 'Haikouille was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_haikouille
      @haikouille = Haikouille.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def haikouille_params
      params.require(:haikouille).permit(:first, :second, :third, :title)
    end
end
