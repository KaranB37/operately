import * as React from "react";
import * as Tabs from "@/components/Tabs";

import { Person } from "@/models/people";
import { Paths } from "@/routes/paths";

import Avatar from "@/components/Avatar";

interface PageHeaderProps {
  person: Person;
  activeTab: "about" | "goals";
}

export function PageHeader(props: PageHeaderProps) {
  return (
    <div>
      <div className="flex items-center gap-4">
        <Avatar person={props.person} size={72} />
        <div className="flex flex-col">
          <div className="text-xl font-bold">{props.person.fullName}</div>
          <div className="font-medium">{props.person.title}</div>
        </div>
      </div>

      <Tabs.Root activeTab={props.activeTab}>
        <Tabs.Tab id="about" title="About" linkTo={Paths.profilePath(props.person.id)} />
        <Tabs.Tab id="goals" title="Goals" linkTo={Paths.profileGoalsPath(props.person.id)} />
      </Tabs.Root>
    </div>
  );
}
