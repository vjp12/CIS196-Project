class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end    

  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    @investments = Investment.where(member_id: @member.id)
    @posts = Post.where(member_id: @member.id).order(:title)
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        UserMailer.send_signup_email(@member).deliver
        #UserMailer.registration_confiramtion(@member).deliver
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    redircet_to delete_member_investments_path(:id)
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  # place an order for an investment
  def order
    Rails.logger.debug("debug::     Old funds : " + current_member.funds.to_s)
    current_member.funds += BigDecimal(params[:change])
    Rails.logger.debug("debug:: Updated funds 1: " + current_member.funds.to_s)
    current_member.update(member_params)
    Rails.logger.debug("debug:: Updated funds 2: " + current_member.funds.to_s)
    redirect_to current_member, notice: 'The investment was successfully added.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :id, :email, :funds, :value)
    end
end
