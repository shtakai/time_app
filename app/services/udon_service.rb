#frozen_string_literal: true

class UdonService
  UdonTimeError = Class.new(StandardError)

  def perform!
    ensure_time
    "FUCK OFF"
  end

  private

  def ensure_time
    puts "current_time: #{current_time}"
    raise UdonTimeError if current_time.hour == 0
  end

  def current_time
    # Time.zone.now
    Time.current.in_time_zone('Tokyo')
  end

end
