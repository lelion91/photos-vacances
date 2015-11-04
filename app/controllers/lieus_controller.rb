class LieusController < ApplicationController
  before_action :set_lieu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /lieus
  # GET /lieus.json
  def index
    @lieus = Lieu.all
  end

  # GET /lieus/1
  # GET /lieus/1.json
  def show
  end

  # GET /lieus/new
  def new
    @lieu = current_user.lieus.build
  end

  # GET /lieus/1/edit
  def edit
  end

  # POST /lieus
  # POST /lieus.json
  def create
    @lieu = current_user.lieus.build(lieu_params)

    respond_to do |format|
      if @lieu.save
        format.html { redirect_to @lieu, notice: 'Lieu cree.' }
        format.json { render :show, status: :created, location: @lieu }
      else
        format.html { render :new }
        format.json { render json: @lieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lieus/1
  # PATCH/PUT /lieus/1.json
  def update
    respond_to do |format|
      if @lieu.update(lieu_params)
        format.html { redirect_to @lieu, notice: 'Lieu was successfully updated.' }
        format.json { render :show, status: :ok, location: @lieu }
      else
        format.html { render :edit }
        format.json { render json: @lieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lieus/1
  # DELETE /lieus/1.json
  def destroy
    @lieu.destroy
    respond_to do |format|
      format.html { redirect_to lieus_url, notice: 'Lieu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lieu
      @lieu = Lieu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lieu_params
      params.require(:lieu).permit(:nom, :commentaire, :recommandation)
    end
    
    def correct_user
      @lieu = current_user.lieus.find_by(id: params[:id])
      redirect_to lieus_path, notice: 'Pas autorise a modifier cet element' if @lieu.nil?
    end
    
end
