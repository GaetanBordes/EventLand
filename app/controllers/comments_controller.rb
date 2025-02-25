class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Commentaire ajouté avec succès !"
    else
      flash[:alert] = "Erreur lors de l'ajout du commentaire."
    end

    redirect_to event_path(@event)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = "Commentaire supprimé."
    else
      flash[:alert] = "Vous ne pouvez pas supprimer ce commentaire."
    end
    redirect_to event_path(@comment.event)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
