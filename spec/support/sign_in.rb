def session_authentication(user_id=nil)
  {'rack.session' => {user_id: user_id}}
end

def current_user_uid
  '12345'
end
