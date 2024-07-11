class HelloController < ApplicationController
  def get
    render :json => { :message => "Hello World" }
  end

  def get_bot
    response_body = api_request("completions", {
      model: "gpt-3.5-turbo",
      messages: [{"role": "user", "content": "Say this is a test!"}],
      temperature: 0.7
    })
    render :json => response_body
  end

  private

  def api_request(endpoint, body=nil)
    uri = URI("https://api.openai.com/v1/chat/#{endpoint}")
    api_key = Rails.application.credentials.open_ai_api_key

    # Create the request
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json', 'Authorization' => "Bearer #{api_key}"})

    request.body = body.to_json
    response = http.request(request)
    JSON.parse(response.body)
  end
end
