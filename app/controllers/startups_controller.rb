#Startup controller
class StartupsController < ApplicationController
  before_filter :authenticate_user!

  # Creates new startup objects
  def new
    @startup = Startup.new
  end

  # Saves a new startup
  def create
    @startup = Startup.create(startup_params)
    @startup.user = current_user
      @startup.save
    redirect_to startups_path
  end

  # Finds startup by id
  def show
    @startup = Startup.find(params[:id])
  end

  # Edit action
  def edit
    @startup = Startup.find(params[:id])
  end

  # Updates a startup
  def update
    @startup = Startup.find(params[:id])
    if @startup.update_attributes(startup_params)
      redirect_to startups_path
    else
      render 'edit'
    end
  end

  # Upvotes a startup
  def upvote
    @startup = Startup.find(params[:id])
    upvote = @startup.upvotes.find_or_create_by(user: current_user)
    upvote.save
    redirect_to startups_path
  end

  # Undo the upvote of a startup
  def undo_upvote
    @startup = Startup.find(params[:id])
    upvote = @startup.upvotes.find_by(user: current_user)
    upvote.destroy
    redirect_to startups_path
  end

  # Params required for CRUD operations
  def startup_params
    params.require(:startup).permit!
  end

  # Shows all startups in descending order
  def index
    @startups = Startup.order(id: :desc) # .page params[:page]
  end

  # Deletes a startup
  def destroy
    @startup = Startup.find(params[:id])
    @startup.destroy
    redirect_to startups_path
  end
end
