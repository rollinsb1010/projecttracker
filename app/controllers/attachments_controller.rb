class AttachmentsController < ApplicationController
  respond_to :html, :xml
  
  def index
     @attachments = Attachment.all
     respond_with @attachments
  end
  
  def new
     @attachment = Attachment.new(:project_id => params[:project_id])
     # respond_with @attachment
  end
  
  def create
     @attachment = Attachment.new(params[:attachment])
     if @attachment.save
       cookies[:last_attachment_id] = @attachment.project_id
       flash[:notice] = "Successfully created attachment."
       redirect_to @attachment.project
       # respond_with(@attachment) 
     else
       render :action => 'new'
     end     
  end
    
  
  def edit
    @attachment = Attachment.find(params[:id])
    respond_with @attachment
  end  
  
  def update
    @attachment = Attachment.find(params[:id])
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = "Successfully updated attachment."
        #redirect_to @attachments
        # respond_with(@attachment) 
        redirect_to @attachment.project
      else
        render :action => 'edit'
      end  
   end 
 
 
  def destroy
      @attachment = Attachment.find(params[:id])
      @attachment.destroy
      flash[:notice] = "Successfully destroyed attachment."
      # respond_with(@attachment)
      redirect_to @attachment.project
  end
end  
 

