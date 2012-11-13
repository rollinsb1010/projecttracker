class AttachmentsController < ApplicationController
  respond_to :html, :xml
  
  def index
     @attachments = Attachment.all
     respond_with @attachments
  end
  
  def new
     @attachment = Attachment.new
     respond_with @attachment
  end
  
  def create
     @attachment = Attachment.new(params[:attachment])
     if @attachment.save
       cookies[:last_attachment_id] = @attachment.id
       flash[:notice] = "Successfully created attachment."
     end
     respond_with(@attachment)  
  end
    
  def show
     @attachment = Attachment.find(params[:id])
     respond_with @attachment  
  end
  
  def edit
    @attachment = Attachment.find(params[:id])
    respond_with @attachment
  end  
  
  def destroy
      @attachment = Attachment.find(params[:id])
      @attachment.destroy
      flash[:notice] = "Successfully destroyed attachment."
      respond_with(@attachment)
  end
  
  def update
    @attachment = Attachment.find(params[:id])
      if @attachment.update_attributes(params[:attachment])
        flash[:notice] = "Successfully updated attachment."
        #redirect_to @attachments
      end  
      respond_with(@attachment)  
        #render "edit"
  end 
end
