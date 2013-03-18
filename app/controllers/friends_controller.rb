class FriendsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @friends = current_user.friends
  end

  def requests
    @requests = current_user.pending_invited_by
  end

  def invite
    friend = User.find(params[:id])
    current_user.invite friend
    redirect_to friends_path, notice: "La demande de contact envers #{friend.email} a bien ete effectuee."
  end

  def accept
    friend = User.find(params[:id])
    current_user.approve friend
    redirect_to friends_path, notice: "#{friend.email} fait desormais parti de vos contacts."
  end

  def refuse
    friend = User.find(params[:id])
    current_user.remove_friendship friend
    redirect_to friends_path, notice: "Le contact #{friend.email} a ete mis en attente. Vous pourrez l'ajouter plus tard."
  end

  def block
    friend = User.find(params[:id])
    current_user.block friend
    redirect_to friends_path, notice: "Vous avez bloque #{friend.email}."
  end

  def remove
    friend = User.find(params[:id])
    current_user.remove_friendship friend
    redirect_to friends_path, notice: "#{friend.email} ne fait plus partit de vos contacts."
  end
end
