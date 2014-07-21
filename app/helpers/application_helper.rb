module ApplicationHelper
	def nice_date_form(the_date)
      if !the_date.nil? 
         the_date.strftime("%d/%m/%y")
      end
   end

   def getAllLocations
   		["Mumbai","Banglore","Gurgaon","Kolkata","NYC"]
   end
end
