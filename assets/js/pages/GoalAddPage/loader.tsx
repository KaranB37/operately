import * as Pages from "@/components/Pages";
import * as Companies from "@/models/companies";
import * as People from "@/models/people";
import * as Groups from "@/models/groups";

interface LoaderResult {
  company: Companies.Company;
  me: People.Person;

  space?: Groups.Group;
  spaceID?: string;
  spaces?: Groups.Group[];

  allowSpaceSelection: boolean;
}

// There are two ways we can end up on this page:
// 1. We are navigating to a specific space, and we have the space ID in the URL.
// 2. We are navigating to /goals/new, and we need to pick a space.

export async function loader({ params }): Promise<LoaderResult> {
  const spaceID = params.id;

  const company = await Companies.getCompany();
  const me = await People.getMe();

  if (spaceID) {
    const space = await Groups.getGroup(params.id);

    return { company, me, spaceID, space, allowSpaceSelection: false };
  } else {
    const spaces = await Groups.getGroups();
    return { company, me, spaces, allowSpaceSelection: true };
  }
}

export function useLoadedData(): LoaderResult {
  return Pages.useLoadedData() as LoaderResult;
}