ActiveSupport::Notifications.subscribe(%r{^AuthenticateUser}) do |name, _start, _finish, _id, payload|

  # add in all of the custom attributes we've set up to the payload for the custom event
 Current.attributes&.each do |key, value|
    payload[key] = value if value.present?
  end

  ::NewRelic::Agent.record_custom_event(name, payload)
end
