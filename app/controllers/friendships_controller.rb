class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
def create
  @friendship = current_user.friendships.build()
  @friendship.friend_id = params[:friend_id]
  @friendship.confirmed = 0
  if @friendship.save
    redirect_to (:back)
  else
    redirect_to (:back)
  end
end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
	friendship = Friendship.find_by_id(params[:id])
	friendship.confirmed = 1
	    if friendship.save
	      redirect_to (:back)
	    else
	      redirect_to (:back)
	    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  redirect_to (:back)
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :confirmed, :create, :destroy)
    end
end
