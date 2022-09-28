class UserSerializer
  include JSONAPI::Serializer

  set_type 'users'
  attributes :email, :api_key
end
# 08288ed8de119120d5d061a451fdbdb7
