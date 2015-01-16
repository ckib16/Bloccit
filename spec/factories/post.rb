FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies have to be pretty long"
    user
    topic { Topic.create(name: 'Topic name') }
  end
end