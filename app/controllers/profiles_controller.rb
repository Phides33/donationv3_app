class ProfilesController < ApplicationController
  before_action :prof_find, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    if pparams[:amount_bracket] != ""
      @profile.amount_bracket = pparams[:amount_bracket].to_i
      @profile.step = 1
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
    if @profile.step == 3
      @profile.full_name = pparams[:full_name]
      @profile.save
      flash.now[:alert] = "Succès!"
    elsif @profile.step == 2
      if pparams.values[0] != ""
        a = pparams.keys[0].to_sym
        @profile[a] = pparams.values[0].to_i
        @profile.step += 1
        @profile.save
        redirect_to edit_profile_path(@profile)
      else
        flash.now[:alert] = "Veuillez sélectionner une des options proposées"
        render :edit
      end
    elsif @profile.step == 1
      if pparams.values[0] != ""
        a = pparams.keys[0].to_sym
        @profile[a] = pparams.values[0].to_i
        @profile.step += 1
        @profile.save
        redirect_to edit_profile_path(@profile)
      else
        flash.now[:alert] = "Veuillez sélectionner une des options proposées"
        render :edit
      end
    end
  end

  private

  def prof_find
    @profile = Profile.find(params[:id])
  end

  def pparams
    params.require(:profile).permit(:full_name, :amount_bracket, :cause, :own_emotion)
  end
end
