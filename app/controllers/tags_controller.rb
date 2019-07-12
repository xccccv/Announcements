class TagsController < ApplicationController
  
  def new
    @tag = Announcement.find(announce_id).tags.new(:announcement_id => announce_id)
  end

  def create
    @tag = Tag.new(tag_params)
    
    Announcement.find(@tag.announcement_id).tags.each do |f|
      if @tag.tag == f.tag
        flash[:notice] = "The same tag already exists"
        redirect_to(announcement_path(@tag.announcement_id))
        return 
      end
    end

    if @tag.save
      flash[:notice] = "Tag created successfully"
      redirect_to(announcement_path(@tag.announcement_id))
    else
      render('new')
    end
  end

  def delete
    @tag = Tag.find(params[:id])
  end

  def destroy
    announceId = Tag.find(params[:id]).announcement_id
    if Tag.find(params[:id]).destroy 
      flash[:notice] = "Tag deleted successfully"
      redirect_to(announcement_path(announceId))
    end
  end
  
  private 

  def tag_params
    params.require(:tag).permit(:tag, :announcement_id)
  end

  def announce_id 
    params["format"]
  end
end
