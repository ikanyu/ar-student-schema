require_relative '../../db/config' 

class Student < ActiveRecord::Base
# implement your Student model here

validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
validates :email, uniqueness: true
validates :age, numericality: { greater_than_or_equal_to: 5 }
#validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/ }
validates :phone, format:{ with: /(\d[^\d]*){10,}/,message:"Valid phone number only"}
	def name
		return first_name + " " + last_name
	end

	def age
    	age = (Time.now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    	return age
  	end
end
