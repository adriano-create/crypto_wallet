module ApplicationHelper
	def locale
		I18n.locale == :en ? "Estados Unidos" : "Portugês do Brasil"
	end

	def data_br(data_us)
		data_us.strftime("%d/%m/%Y")
	end	
end
