require 'google/api_client'
require 'httparty'
require 'trollop'

class YoutubeLoader
  def initialize(api_key = "nil", service_name = 'youtube', api_version = 'v3' )
    @api_key = api_key || ENV['YOUTUBE_API_KEY']
    @service_name = service_name
    @api_version = api_version
    @client = Google::APIClient.new(key: @api_key, authorization: nil, application_name: 'yt-playlister', application_version: '0.0.1')
    binding.pry
  end

  def yt_options
    Trollop::options do
      opt :q, 'Search term', type: String, default: 'Google'
      opt :maxResults, 'Max results', type: :int, default: 25
      opt :part, 'Param', type: String, default: 'id,snippet'
    end
  end
end

response = @client.execute!(
  :api_method => youtube.search.list,
  :parameters => yt_options
)
