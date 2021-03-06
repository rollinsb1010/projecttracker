class ProjectsController < ApplicationController
  respond_to :html, :xml
  
  def index
     @projects = Project.all
     respond_with @projects
  end
  
  def new
     @project = Project.new
     respond_with @project
  end
  
  def create
     @project = Project.new(params[:project])
     if @project.save
       cookies[:last_project_id] = @project.id
       flash[:notice] = "Successfully created project."
     end
     respond_with(@project)  
  end
    
  def show
     @project = Project.find(params[:id])
     respond_with @project  
  end
  
  def edit
    @project = Project.find(params[:id])
    respond_with @project
  end  
  
  def destroy
      @project = Project.find(params[:id])
      @project.destroy
      flash[:notice] = "Successfully destroyed project."
      respond_with(@project)
  end
  
  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        flash[:notice] = "Successfully updated project."
        #redirect_to @projects
      end  
      respond_with(@project)  
        #render "edit"
  end 
end
