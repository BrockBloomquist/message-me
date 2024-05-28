class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy add_friend ]
  before_action :require_user, only: %i[edit update index show friends]
  before_action :require_same_user, only: %i[edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # UPDATE /users/1 invite
  def add_friend
    respond_to do |format|
      debugger
      if current_user.send_invitation(@user)
        format.html { redirect_to user_url(@user), notice: "A friend request has been sent."}
      else 
        format.html { redirect_to root_url, notice: "There was an error handling your request.", status: 400 }
      end 
    end
  end

  def friends
    @user = current_user
  end

  def requests
    @requests = current_user.invitations
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :bio)
    end

    def require_same_user
      return unless current_user != @user && !current_user.admin?

      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
end
