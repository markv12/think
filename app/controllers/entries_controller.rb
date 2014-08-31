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
  end

  private
    def entry_params
      params.require(:entry).permit(:text)
    end
end