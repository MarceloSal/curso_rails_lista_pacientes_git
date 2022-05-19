json.extract! patientlist, :id, :register_name, :email, :created_at, :updated_at
json.url patientlist_url(patientlist, format: :json)
