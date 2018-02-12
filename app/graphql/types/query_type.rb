Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :currentUser do
    type Types::UserType
    description 'Get the current user'

    resolve ->(obj, args, ctx) { ctx[:current_user] }
  end
end
