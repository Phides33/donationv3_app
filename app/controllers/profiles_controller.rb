class ProfilesController < ApplicationController
  before_action :prof_find, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    if pparams[:amount_bracket] != ""
      @profile.amount_bracket = pparams[:amount_bracket].to_i
      @profile.save
      redirect_to edit_profile_path(@profile)
    else
      flash.now[:alert] = "Veuillez sélectionner une des options proposées"
      render :new
    end
  end

  def edit
  end

  def update
    if pparams[:full_name] != nil
      @profile.full_name = pparams[:full_name]
      @profile.save
      flash.now[:alert] = "Succès!"
    elsif pparams[:cause] != ""
      @profile.cause = pparams[:cause].to_i
      @profile.save
      redirect_to edit_profile_path(@profile)  
    else
      raise
    end
  end

  private

  def prof_find
    @profile = Profile.find(params[:id])
  end

  def pparams
    params.require(:profile).permit(:full_name, :amount_bracket, :cause)
  end
end
