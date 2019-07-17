# frozen_string_literal: true

class TagsController < ApplicationController
  def new
    @tag = Announcement.find(announce_id).tags
                       .new(announcement_id: announce_id)
  end

  def create
    @tag = Tag.new(tag_params)

    Announcement.find(@tag.announcement_id).tags.each do |f|
      next unless @tag.tag == f.tag || @tag.tag.length < 1

      flash[:notice] = 'The same tag already exists or text field is empty'
      redirect_to(announcement_path(@tag.announcement_id))
      return
    end

    if @tag.save
      flash[:notice] = 'Tag created successfully'
      redirect_to(announcement_path(@tag.announcement_id))
    else
      render('new')
    end
  end

  def delete
    @tag = Tag.find(params[:id])
  end

  def destroy
    announcm_id = Tag.find(params[:id]).announcement_id
    flash[:notice] = 'Tag deleted successfully' if Tag.find(params[:id])
                                                                      .destroy
      redirect_to(announcement_path(announcm_id))
  end

  private

  def tag_params
    params.require(:tag).permit(:tag, :announcement_id)
  end

  def announce_id
    params['format']
  end
end
