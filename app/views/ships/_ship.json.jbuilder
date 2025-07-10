json.extract! ship, :id, :name, :registry, :shipClass, :captain, :launched, :decommissioned, :created_at, :updated_at
json.url ship_url(ship, format: :json)
