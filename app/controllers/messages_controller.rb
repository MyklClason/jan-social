class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    # A user must be logged in to see this page
    @message.creator = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    if @message.creator == current_user
      flash[:warning] = "You cannot vote on your own messages"
    else
      @message.liked_by current_user
      if @message.vote_registered?
        flash[:success] = "You liked that message"
      else
        @message.unliked_by current_user
        flash[:info] = "You unliked that message"
      end
    end
    redirect_to(:back)
  end

  def dislike
    if @message.creator == current_user
      flash[:warning] = "You cannot vote on your own messages"
    else
      @message.disliked_by current_user
      if @message.vote_registered?
        flash[:warning] = "You disliked that message"
      else
        @message.undisliked_by current_user
        flash[:info] = "You undisliked that message"
      end
    end
    redirect_to(:back)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:creator, :content)
  end

  def require_same_user
    if current_user != @message.creator
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to(:back)
    end
  end

end
