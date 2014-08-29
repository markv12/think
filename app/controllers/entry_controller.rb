class EntryController < ApplicationController
  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      flash[:notice] = "Entry Saved"
      redirect_to user_path(@entry.user)
    else
      redirect_to :back
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:text)
    end
end