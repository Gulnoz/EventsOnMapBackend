class UserSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes  :email, :events, :favorite_events
end
