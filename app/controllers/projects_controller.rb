class ProjectsController < ApplicationController
  def index
     @projects = Project.all
  end
  
  def new
    @projects = Project.all
  end
  
  def show
    @projects = Project.all    
  end
  
  def destroy
    @projects = Project.all
  end
  
  def update
    @projects = Project.find(params[:id])
      if @projects.update_attributes(params[:project])
        redirect_to @projects
      else
        render "edit"
      end
   end 
   
  def edit
    @projects = Project.find(params[:id])
    if @projects.edit_attributes(params[:project])
      redirect_to @projects
    else
      render :text => "Project does not exist"  
    end
  end    
      
  
end
