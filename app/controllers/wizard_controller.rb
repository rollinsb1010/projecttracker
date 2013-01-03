class WizardController < ApplicationController
respond_to :html, :xml
  
  def index
     @wizards = Wizard.all
     respond_with @wizards
  end
  
  def new
     @wizard = Wizard.new
     # respond_with @wizard
  end
  
  def create
     @wizard = wizard.new(params[:wizard])
     if @wizard.save
       cookies[:last_wizard_id] = @wizard.id
       flash[:notice] = "Successfully created wizard."
       # redirect_to @wizard.project
        respond_with @wizard
     else
       render :action => 'new'
     end     
  end
  
  
  def edit
    @wizard = wizard.find(params[:id])
    respond_with @wizard
  end  
  
  def update
    @wizard = wizard.find(params[:id])
      if @wizard.update_attributes(params[:wizard])
        flash[:notice] = "Successfully updated wizard."
        #redirect_to @wizards
        respond_with @wizard
      else
        render :action => 'edit'
      end  
   end 
 
 
  def destroy
      @wizard = wizard.find(params[:id])
      @wizard.destroy
      flash[:notice] = "Successfully destroyed wizard."
      respond_with @wizard
  end
  
  def show
      @wizard = wizard.find(params[:id])
      #render :view => 'proposal_step'
      respond_with @wizard 
  end
end  
 



  


