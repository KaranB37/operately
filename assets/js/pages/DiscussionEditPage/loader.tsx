import * as Pages from "@/components/Pages";
import * as Discussions from "@/models/discussions";

interface LoaderResult {
  discussion: Discussions.Discussion;
}

export async function loader({ params }): Promise<LoaderResult> {
  return {
    discussion: await Discussions.getDiscussion(params.id),
  };
}

export function useLoadedData(): LoaderResult {
  return Pages.useLoadedData() as LoaderResult;
}

export function useRefresh() {
  return Pages.useRefresh();
}
