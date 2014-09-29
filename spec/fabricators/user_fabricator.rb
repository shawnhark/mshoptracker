Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password 'password'
  token {Faker::Number.number(10)}
  admin false
  active true
end

Fabricator(:invalid_user, from: :user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  password 'password'
  token {Faker::Number.number(10)}
  admin false
  active true
end

Fabricator(:admin, from: :user) do
  admin true
end

Fabricator(:inactive, from: :user) do
  active false
end