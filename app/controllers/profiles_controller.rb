class ProfilesController < ApplicationController
  before_action :prof_find, only: [:edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.amount_bracket = pparams[:amount_bracket].to_i
    raise
    if @profile.save
      flash.now[:notice] = "Etape 1 ok!"
      redirect_to edit_profile_path(@profile)
    else
      raise
      flash.now[:alert] = @profile.errors[:amount_bracket][1]
      render :new
    end
  end

  def update
    @profile.full_name = pparams[:full_name]
    @profile.save
    flash.now[:alert] = "Succès!"
  end

  private

  def prof_find
    @profile = Profile.find(params[:id])
  end

  def pparams
    params.require(:profile).permit(:full_name, :amount_bracket)
  end
end
