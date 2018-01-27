10.times do
  User.create!(
    provider:       "email",
    uid:            Faker::Internet.email,
    name:           Faker::Name.name,
    nickname:       Faker::Simpsons.character,
    image:          Faker::Avatar.image,
    email:          Faker::Internet.email,
    password:       "12345678",
    account_number: 113183314,
  )

  Company.create!(
    name:           Faker::Company.name,
    bs:             Faker::Company.bs,
    logo:           Faker::Company.logo,
    org_type:       Faker::Company.type,
    account_number: 113183311,
  )
end


# rails g scaffold Company name:string bs:string logo:string org_type:string
