class LifxController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def set_status
    if ENV['LIFX_TOKEN'].blank?
      render :json => 'The environment variable LIFX_TOKEN has to be set in the server'.to_json
      return
    end
    new_status = {}

    power = params[:power].to_s.downcase
    new_status[:power] = power if power.in?(['on', 'off'])

    brightness = params[:brightness].to_f
    new_status[:brightness] = brightness if brightness > 0 && brightness <= 1

    color = params[:color].to_s.downcase
    new_status[:color] = color if color.in?(['white', 'red', 'orange', 'yellow', 'cyan', 'green', 'blue', 'purple', 'pink'])

    if new_status.present?
      HTTParty.put('https://api.lifx.com/v1/lights/id:d073d5031b2a/state', :query => new_status, :headers => {
        'Authorization' => "Bearer #{ENV['LIFX_TOKEN']}"
      })
    end

    render 'show'
  end
end
