module ContractsHelper
	def conditional_div( contract_type )
		case contract_type
		when 1
			return "panel-primary"
		when 2
			return "panel-info"
		when 3
			return "panel-warning"
		when 4
			return "panel-success"
		when 5
			return "panel-danger"
		else
			return "panel-default"
		end
	end
end
