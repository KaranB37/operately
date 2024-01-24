import client from "@/graphql/client";

import * as Pages from "@/components/Pages";
import * as Goals from "@/models/goals";
import * as Updates from "@/graphql/Projects/updates";
import * as People from "@/models/people";

interface LoaderResult {
  goal: Goals.Goal;
  update: Updates.Update;
  me: People.Person;
}

export async function loader({ params }): Promise<LoaderResult> {
  let updateData = await client.query({
    query: Updates.GET_STATUS_UPDATE,
    variables: { id: params.id },
    fetchPolicy: "network-only",
  });

  return {
    goal: await Goals.getGoal(params.goalId, {
      includeTargets: true,
    }),
    update: updateData.data.update,
    me: await People.getMe(),
  };
}

export function useLoadedData(): LoaderResult {
  return Pages.useLoadedData() as LoaderResult;
}

export function useRefresh() {
  return Pages.useRefresh();
}