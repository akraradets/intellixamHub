json.extract! admins_organization, :id, :username, :encrypted_password, :tax_id, :email, :name, :address, :created_by, :created_at, :updated_at
json.url admins_organization_url(admins_organization, format: :json)
