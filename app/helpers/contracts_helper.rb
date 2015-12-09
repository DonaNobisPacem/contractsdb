module ContractsHelper
	def conditional_div( contract_type )
		case contract_type
		when 1
			return "panel-success"
		when 2
			return "panel-info"
		when 3
			return "panel-warning"
		else
			return "panel-danger"
		end
	end
end
