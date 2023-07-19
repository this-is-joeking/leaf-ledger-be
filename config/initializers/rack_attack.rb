class Rack::Attack
  throttle('plants/ip', limit: 5, period: 3600.seconds) do |req|
    if req.path == '/api/v1/plants' && req.post?
      # Normalize the email, using the same logic as your authentication process, to
      # protect against rate limit bypasses. Return the normalized email if present, nil otherwise.
      req.ip
    end
  end
end