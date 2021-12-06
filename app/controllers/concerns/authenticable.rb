module Authenticable
  def current_user
    # Return the current_user based on the JWT token passed into the Authorization header of the request (API call)
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end
end