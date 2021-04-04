class ApplicationController < ActionController::Base
  before_action :set_custom_attributes

  def device_id
    cookies[:device_id] ||= { value: SecureRandom.uuid, expires: 10.years.from_now }
  end

  def custom_attributes
    { device_id: device_id,
      remote_ip: request.remote_ip,
      request_id: request.request_id
    }
  end

  def set_custom_attributes
    Current.assign_attributes(custom_attributes)
  end
end
