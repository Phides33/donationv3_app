class ProfilesController < ApplicationController
  before_action :prof_find, only: [:edit, :update]

  def index
    @profile = Profile.last
  end

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
    if @profile.step == 5 || @profile.step == 10
      a = pparams.values[0]
      k = pparams.keys[0].to_sym
      if !!(a =~ /\A[^\/\\@]*\z/) && (a.length <= 200) && (a.length >= 3)
        @profile[k] = a
        @profile.step += 1
        @profile.save
        redirect_to edit_profile_path(@profile)
      elsif !(a =~ /\A[^\/\\@]*\z/)
        flash.now[:alert] = "Votre réponse ne peut pas comporter des caractères spéciaux"
        render :edit
      elsif a.length > 200
        flash.now[:alert] = "Votre réponse est un peu longue, non ?"
        render :edit
      else
        flash.now[:alert] = "Votre réponse est un peu courte, non ?"
        render :edit
      end
    elsif @profile.step == 7
      if !!(pparams[:po_code] =~ /^\d{5}$/)
        @profile.po_code = pparams[:po_code]
        @profile.step += 1
        @profile.save
        redirect_to edit_profile_path(@profile)
      else
        flash.now[:alert] = "Votre réponse doit comporter 5 chiffres exactement"
        render :edit
      end
    elsif @profile.step == 11
      if !!(pparams[:mobile_number] =~ /^0[6-7][0-9]{8}$/)
        @profile.mobile_number = pparams[:mobile_number]
        @profile.step += 1
        @profile.save
        redirect_to edit_profile_path(@profile)
      else
        flash.now[:alert] = "Votre réponse doit comporter 10 chiffres exactement,
          le premier doit être 0 et le second 6 ou 7"
        render :edit
      end
    elsif @profile.step == 12
      if !!(pparams[:email] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/)
        @profile.email = pparams[:email]
        @profile.save
        redirect_to profiles_path(@profile)
      else
        flash.now[:alert] = "Votre réponse doit être un email valide"
        render :edit
      end
    else
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
    params.require(:profile).permit(:full_name, :amount_bracket, :cause, :own_emotion,
      :other_emotion, :preferred_mean, :money_wish, :age_bracket, :po_code,
      :main_mobility_mode, :motor_vehicle_owner, :mobile_number, :email)
  end
end
