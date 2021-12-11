FactoryBot.define do
  factory :candidate do
    first_name { "Raphaël" }
    last_name { "Marsan" }
    email { "wiiipe@gmail.com" }
    association :position
  end
end
