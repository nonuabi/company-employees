class DevelopersController < ApplicationController
  before_action :set_developer, only: %i[ show edit update destroy ]
  before_action :admin_logged_in?
  after_action :update_log,only: :destroy
  # GET /developers or /developers.json
  def index
    @developers = Developer.all
    respond_to do |format|
      format.html
      format.xml {render xml: @developers.as_json}
    end
  end

  # GET /developers/1 or /developers/1.json
  def show
  end

  # GET /developers/new
  def new
    @developer = Developer.new
  end

  # GET /developers/1/edit
  def edit
  end

  # POST /developers or /developers.json
  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: "Developer was successfully created." }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developers/1 or /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: "Developer was successfully updated." }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1 or /developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: "Developer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def admin_logged_in?
    if session[:admin].nil?
      flash[:notice]="First You have to Log in  "
      redirect_to :controller => "admin",:action => "login"
    end
  end
  def update_log
    logger.info " -$$$- Developer is Updated -$$$-"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def developer_params
      params.require(:developer).permit(:first_name, :last_name, :profile, :email_id, :github_id, :phone_number)
    end


end
