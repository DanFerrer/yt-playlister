require 'google/api_client'

class YoutubeLoader
  def initialize(api_key = "AIzaSyCI8rK0KdK_tVxXTC45XlGKdDG0_FSLldc", service_name = 'youtube', api_version = 'v3' )
    @api_key = api_key || ENV['YOUTUBE_API_KEY']
    @service_name = service_name
    @api_version = api_version
    @client = Google::APIClient.new(key: @api_key, authorization: nil, application_name: 'yt-playlister', application_version: '0.0.1')
  end

  def search_videos(options = {})
    options[:q] ||= 'Nyan Cat'
    options[:maxResults] ||= 25
    options[:part] ||= 'snippet'
    options[:type] = 'video'
    client.execute!(
      api_method: discovered_api.search.list,
      parameters: options
    )
  end

  def discovered_api
    client.discovered_api(service_name, api_version)
  end
end
