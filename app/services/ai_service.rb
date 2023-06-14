class AiService
  def self.conn
    Faraday.new(
      url: 'https://api.openai.com', 
      headers: { 'Content-Type' => 'application/json' },
    ) do |conn|
      conn.request :authorization, 'Bearer', ENV['OPENAI_API_KEY']
    end
  end
end