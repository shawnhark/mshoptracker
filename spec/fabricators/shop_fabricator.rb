Fabricator(:shop) do
  store_name {Faker::Company.name}
  location {Faker::Address.city}
  shop_date {Faker::Date.today}
  shop_time {Faker::Time.now}
  expenses {Faker::Number(1)}
  reimbursement {Faker::Number(2)}
  fee {Faker::Number(1)}
  ms_company {Faker::Company.name}
end