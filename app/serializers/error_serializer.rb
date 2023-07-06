class ErrorSerializer
  def self.not_found(error_message)
    {
      "error": {
        "code": 404,
        "message": error_message
      }
    }
  end

  def self.bad_params(error_message)
    {
      "error": {
        "code": 422,
        "message": error_message
      }
    }
  end

  def self.missing_param(param)
    {
      "error": {
        "code": 422,
        "message": "Invalid request, no #{param} param given"
      }
    }
  end

  def self.missing_value(param)
    {
      "error": {
        "code": 422,
        "message": "Invalid request, no value for #{param} param given"
      }
    }
  end
end
