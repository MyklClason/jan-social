class LikeDislikesController < ApplicationController
  before_action :set_like_dislike, only: [:show, :edit, :update, :destroy]

  # GET /like_dislikes
  # GET /like_dislikes.json
  def index
    @like_dislikes = LikeDislike.all
  end

  # GET /like_dislikes/1
  # GET /like_dislikes/1.json
  def show
  end

  # GET /like_dislikes/new
  def new
    @like_dislike = LikeDislike.new
  end

  # GET /like_dislikes/1/edit
  def edit
  end

  # POST /like_dislikes
  # POST /like_dislikes.json
  def create
    @like_dislike = LikeDislike.new(like_dislike_params)

    respond_to do |format|
      if @like_dislike.save
        format.html { redirect_to @like_dislike, notice: 'Like dislike was successfully created.' }
        format.json { render :show, status: :created, location: @like_dislike }
      else
        format.html { render :new }
        format.json { render json: @like_dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_dislikes/1
  # PATCH/PUT /like_dislikes/1.json
  def update
    respond_to do |format|
      if @like_dislike.update(like_dislike_params)
        format.html { redirect_to @like_dislike, notice: 'Like dislike was successfully updated.' }
        format.json { render :show, status: :ok, location: @like_dislike }
      else
        format.html { render :edit }
        format.json { render json: @like_dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_dislikes/1
  # DELETE /like_dislikes/1.json
  def destroy
    @like_dislike.destroy
    respond_to do |format|
      format.html { redirect_to like_dislikes_url, notice: 'Like dislike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_dislike
      @like_dislike = LikeDislike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_dislike_params
      params.require(:like_dislike).permit(:likes)
    end
end
