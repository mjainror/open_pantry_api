json.user do |json|
  json.partial! 'api/v1/users/detail', user: current_user
end
