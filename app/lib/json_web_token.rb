class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      assign_payload_expiration_time(payload, exp)

      JWT.encode(payload, secret_key)
    end

    def decode(token)
      HashWithIndifferentAccess.new(decode_json_web_token(token))
    end

    private

    def secret_key
      Rails.application.secrets.secret_key_base.to_s
    end

    def assign_payload_expiration_time(payload, exp)
      payload[:exp] = exp.to_i
    end

    def decode_json_web_token(token)
      JWT.decode(token, secret_key)[0]
    end
  end
end
