class EntriesController < ApplicationController
  def update
    @entry = Entry.find(params[:id])
    respond_to do |format|
      if @entry.update(entry_params)
        format.js { render "update", :locals => {entry: @entry} }
      else
        format.js { render "update", :locals => {entry: @entry} }
      end
    end
  end

  def show
    @entry = Entry.find(params[:id])
    if @entry.user != current_user
      redirect_to root_path
    end
  end

  private
    def entry_params
      params.require(:entry).permit(:text)
    end
end