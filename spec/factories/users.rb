FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'hereweare'
    password_confirmation 'hereweare'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end