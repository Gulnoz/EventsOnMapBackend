class UserEventSerializer
  include FastJsonapi::ObjectSerializer
   attributes :user_id, :event_id
end
