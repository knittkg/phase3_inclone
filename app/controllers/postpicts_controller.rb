class PostpictsController < ApplicationController
  before_action :set_postpict, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:new, :edit, :show]

  # GET /postpicts
  # GET /postpicts.json
  def index
    @postpicts = Postpict.all
  end

  # GET /postpicts/1
  # GET /postpicts/1.json
  def show
    @postpict = Postpict.find(params[:id])
    @favorite = current_user.favorites.find_by(postpict_id: @postpict.id)
  end

  # GET /postpicts/new
  def new
    if params[:back]
      @postpict = Postpict.new(postpict_params)
    else
      @postpict = Postpict.new
    end
  end

  # GET /postpicts/1/edit
  def edit
    @postpict = Postpict.find(params[:id])
  end

  # POST /postpicts
  # POST /postpicts.json
  def create
    @postpict = Postpict.new(postpict_params)
    @postpict.user_id = current_user.id
    @postpict.image.retrieve_from_cache! params[:cache][:image] if params[:cache][:image].present?
    @postpict.save!

    respond_to do |format|
      if @postpict.save
        PostpictMailer.postpict_mail(@postpict).deliver
        format.html { redirect_to @postpict, notice: 'Postpict was successfully created.' }
        format.json { render :show, status: :created, location: @postpict }
      else
        format.html { render :new }
        format.json { render json: @postpict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postpicts/1
  # PATCH/PUT /postpicts/1.json
  def update
    respond_to do |format|
      if @postpict.update(postpict_params)
        format.html { redirect_to @postpict, notice: 'Postpict was successfully updated.' }
        format.json { render :show, status: :ok, location: @postpict }
      else
        format.html { render :edit }
        format.json { render json: @postpict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postpicts/1
  # DELETE /postpicts/1.json
  def destroy
    @postpict.destroy
    respond_to do |format|
      format.html { redirect_to postpicts_url, notice: 'Postpict was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @postpict = Postpict.new(postpict_params)
    render :new if @postpict.invalid?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postpict
      @postpict = Postpict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postpict_params
      params.require(:postpict).permit(:image, :caption)
    end

    def set_current_user
      unless logged_in?
      flash[:warning] = 'ログインして下さい'
      redirect_to new_session_path
      end
    end

end
