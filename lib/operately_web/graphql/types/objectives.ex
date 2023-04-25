defmodule OperatelyWeb.GraphQL.Types.Objectives do
  use Absinthe.Schema.Notation

  object :objective do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, :string

    field :owner, :person do
      resolve fn objective, _, _ ->
        person = Operately.Okrs.get_owner!(objective)

        {:ok, person}
      end
    end
  end

  input_object :create_objective_input do
    field :name, non_null(:string)
    field :description, :string
    field :timeframe, non_null(:string)
    field :owner_id, non_null(:id)
  end

end
