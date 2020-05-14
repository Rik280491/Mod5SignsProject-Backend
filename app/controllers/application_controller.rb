class ApplicationController < ActionController::API

  def secret
    ENV["SIGN_SECRET"]
  end

  
  def generate_token(data)
    JWT.encode(data, "shh")
  end


  def decode_token
    token = request.headers["Authorization"]
    begin
      JWT.decode(token, "shh").first
    rescue
      {}
    end
  end

  def get_user
    id = decode_token["id"]
    puts id
    User.find_by(id: id)
  end





end
