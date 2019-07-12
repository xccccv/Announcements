class AnnouncementsController < ApplicationController
  
  layout 'admin'

  before_action :confirm_logged_in

  def index
    @announcements = Announcement.all.sortedByDate
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new(:user_id => getUserId)
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save 
      flash[:notice] = "Announcement created successfully."
      redirect_to(announcements_path)
    else 
      render('new')
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end  

  def update 
    @announcement = Announcement.find(params[:id])

    if @announcement.update_attributes(announcement_params) 
      flash[:notice] = "Announcement updated successfully."
      redirect_to(announcement_path(@announcement))
    else
      render('edit')
    end
  end 

  def delete
    @announcement = Announcement.find(params[:id])
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy 
    flash[:notice] = "Announcement '#{@announcement.title}' destroyed successfully."
    redirect_to(announcements_path)
  end

  def search 
    @q = "%#{params[:query]}%"
    @announcements = Announcement.joins(:tags)
                                 .where("title LIKE ? or description LIKE ? or address LIKE ? or tags.tag LIKE ?", @q, @q, @q, @q)
                                 .distinct
    render 'index'
  end

  private 

  def announcement_params 
    params.require(:announcement).permit(:title, :description, :activity, :user_id, :address, :avatar, {avatars: []})
  end
  
end