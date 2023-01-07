module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :users, [Types::UserType], null: false
    def users
      User.all
    end
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :blogposts, [Types::BlogpostType], null: false
    def blogposts
      Blogpost.all
    end
    field :blogpost, Types::BlogpostType, null: false do
      argument :id, ID, required: true
    end
    def blogpost(id:)
      Blogpost.find(id)
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
