json.array!(@financial_terms) do |financial_term|
  json.extract! financial_term, :id, :payer, :payee, :amount, :frequency, :start_date, :end_date, :escalation_rate, :advance, :deposit, :contract_id
  json.url financial_term_url(financial_term, format: :json)
end
