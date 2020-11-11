FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111111b"}
    password_confirmation {"111111b"}
    first_name            {"田中"}
    second_name           {"太郎"}
    first_name_kana       {"カタカナ"}
    second_name_kana      {"カタカナ"}
    birthday              {"1950-01-01"}

  end
end