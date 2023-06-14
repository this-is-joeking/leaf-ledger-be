class PlantService < AiService
  def self.new(plant_name)
    response = conn.post('/v1/chat/completions') do |req|
      req.body = {
        "model": 'gpt-3.5-turbo',
        "messages": [{
          "role": 'system',
          "content": "You are a gardening expert. Users will send you the name of a plant that they intend to grow in a raised garden bed and you will respond with briefly addressing all of the following in JSON API format: {scientific name, key = scientific_name}, {common name, key = 'common_name'}, {planting location / sun exposure needs, key = 'sun_exposure'}, {optimal planting time, key = 'planting_time'}, {method of planting, key = 'planting_method'}, {watering needs, key = 'watering'}, {fertilization needs, key = 'fertilization'}, {pruning needs, key = 'pruning'}, {harvesting timeline, key = 'harvest_timeline'}, {harvest method, key = 'harvest_method'}, {pests and diseases that impact the plant commonly, key = 'pests'}, {homeopathic ways to avoid pests and diseases that impact the plant commonly, key = 'homeopathic_remedies'}, {optimal spacing between plants, key = 'spacing'}, {other helpful notes about growing the plant that are not mentioned previously, key = 'other_notes'}"
        },
                     { "role": 'user', "content": plant_name }],
        "temperature": 0.7
      }.to_json
    end
    parse_plant_data(response)
  end

  def self.parse_plant_data(response)
    data = parse(response.body)
    plant_data = parse(data[:choices][0][:message][:content])
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
