class ProjectsController < ApplicationController
  respond_to :html, :xml
  
  def index
     @projects = Project.all
     respond_with @projects
  end
  
  # def new
     # @project = Project.new
     # respond_with @project
  # end
  
  #New Action for Custom WiZard
   def new
    session[:project_params] ||= {}
    @project = Project.new(session[:project_params])
    @project.current_step = session[:project_step]
  end
  
  # def create
     # @project = Project.new(params[:project])
     # if @project.save
       # cookies[:last_project_id] = @project.id
       # flash[:notice] = "Successfully created project."
       # redirect_to @project
     # else
     # # respond_with(@project)  
     # render :action => 'new'
    # end
  # end
  
  #Custom Wizard Create Action
   def create
     session[:project_params].deep_merge!(params[:project]) if params[:project]
     @project = Project.new(session[:project_params])  
     @project.current_step = session[:project_step]
     if @project.valid?
       if params[:back_button]
        @project.previous_step
       elsif @project.last_step?   
        @project.save if @project.all_valid?
       else
        @project.next_step
       end
       session[:project_step] = @project.current_step
     end 
     
     if @project.new_record? 
        render 'new'
     else
        session[:project_step] = session[:project_params] = nil
        flash[:notice] = "project saved."
        redirect_to @project       
     end
  end  
  
  
  
  def show
     @project = Project.find(params[:id])
     respond_with @project  
  end
  
  def edit
     @project = Project.find(params[:id])
     respond_with @project
  end 
  
  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        flash[:notice] = "Successfully updated project."
        redirect_to project_url
      else
      render :action => 'edit'
      #respond_with(@project)  
        #render "edit"
     end 
  end 
  
  def destroy
     @project = Project.find(params[:id])
     @project.destroy
     flash[:notice] = "Successfully destroyed project."
     redirect_to projects_url
     #respond_with(@project)
  end    
end
  
  
