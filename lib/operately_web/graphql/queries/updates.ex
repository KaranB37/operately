defmodule OperatelyWeb.Graphql.Queries.Updates do
  use Absinthe.Schema.Notation

  input_object :updates_filter do
    field :goal_id, :id
    field :type, :string
  end

  object :update_queries do
    field :updates, non_null(list_of(:update)) do
      arg :filter, non_null(:updates_filter)

      resolve fn args, _ ->
        updateble_id = args.filter[:goal_id]
        updateble_type = "goal"
        update_type = args.filter[:type] && String.to_existing_atom(args.filter.type)

        {:ok, Operately.Updates.list_updates(updateble_id, updateble_type, update_type)}
      end
    end

    field :update, non_null(:update) do
      arg :id, non_null(:id)

      resolve fn args, _ ->
        update = Operately.Updates.get_update!(args.id)

        {:ok, update}
      end
    end
  end
end
