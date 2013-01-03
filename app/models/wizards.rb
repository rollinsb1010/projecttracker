class Wizard < ActiveRecord::Base
  # attr_accessible :title, :body
  
   attr_writer :current_step
  
  validates_presence_of :client_name, :if => :proposal?
  validates_presence_of :project_name, :if => :material?

  def current_step
    @current_step || steps.first
  end
  
  def proposal?
    current_step == "proposal"
  end
  
  def material?
    current_step == "material"
  end
  
  
  def steps
    %w[proposal material confirmation]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?

      end
   end   
end

