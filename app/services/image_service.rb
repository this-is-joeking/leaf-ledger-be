class ImageService < AiService
  def self.new(plant_name)
    response = conn.post('/v1/images/generations') do |req|
      req.body = {
        "prompt": "A mature and flourishing #{plant_name} in a garden in the style of photo realistic art",
        "n": 1,
        "size": "512x512"
    }.to_json
    end
    parse(response.body)
  end
end