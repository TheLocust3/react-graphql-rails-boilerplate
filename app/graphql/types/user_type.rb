Types::UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'A user'

  field :id, !types.ID
  field :email, !types.String
  field :firstName, !types.String, property: :first_name
  field :lastName, !types.String, property: :last_name
end
