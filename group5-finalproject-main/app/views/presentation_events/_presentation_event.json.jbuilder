json.extract! presentation_event, :id, :event_name, :created_at, :updated_at, :due, :status
json.url presentation_event_url(presentation_event, format: :json)
