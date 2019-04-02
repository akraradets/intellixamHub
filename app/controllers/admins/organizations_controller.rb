class Admins::OrganizationsController < ApplicationController
  layout "admins"
  before_action :set_admins_organization, only: [:show, :edit, :update, :destroy]

  # GET /admins/organizations
  # GET /admins/organizations.json
  def index
    @admins_organizations = Organization.all
  end

  # GET /admins/organizations/1
  # GET /admins/organizations/1.json
  def show
  end

  # GET /admins/organizations/new
  def new
    @admins_organization = Organization.new
  end

  # GET /admins/organizations/1/edit
  def edit
  end

  # POST /admins/organizations
  # POST /admins/organizations.json
  def create
    @admins_organization = Organization.new(admins_organization_params)

    respond_to do |format|
      if @admins_organization.save
        format.html { redirect_to @admins_organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @admins_organization }
      else
        format.html { render :new }
        format.json { render json: @admins_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/organizations/1
  # PATCH/PUT /admins/organizations/1.json
  def update
    respond_to do |format|
      if @admins_organization.update(admins_organization_params)
        format.html { redirect_to @admins_organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @admins_organization }
      else
        format.html { render :edit }
        format.json { render json: @admins_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/organizations/1
  # DELETE /admins/organizations/1.json
  def destroy
    @admins_organization.destroy
    respond_to do |format|
      format.html { redirect_to admins_organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_organization
      @admins_organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admins_organization_params
      params.require(:admins_organization).permit(:name, 
        :tax_id,
        :address,
        :contact_name,
        :phone_no,
        :email,
        :note,
        :username,
        :password,
        :password_confirm
      )
    end
end
