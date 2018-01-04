class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new
    @profile.amount_bracket = pparams[:amount_bracket].to_i
   if @profile.save
     # ça marche > rediriger sur question suivante
   else
     flash.now[:alert] = @profile.errors[:amount_bracket][1]
     render :new
end
  end

  private

  def pparams
    params.require(:profile).permit(:last_name, :amount_bracket)
  end
end
