module WorkoutsHelper
    
  def formatted_date
    @date = self.date
    @date.strftime("%A, %B #{@date.day.ordinalize}")
  end
  
end
