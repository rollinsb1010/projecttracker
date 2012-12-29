class WizardController::ProjectsController < ApplicationController

#New Action for Custom WiZard
   def new
    session[:project_params] ||= {}
    @project = Project.new(session[:project_params])
    @project.current_step = session[:project_step]
   end

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
