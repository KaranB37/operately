defmodule Operately.Support.Features.EmailSteps do
  alias Operately.Support.Features.UI
  alias Operately.People.Person

  def assert_project_created_email_sent(ctx, author: author, project: project_name, to: to, role: role) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} created the #{project_name} project in Operately and assigned you as a #{role}")
  end

  def assert_project_archived_sent(ctx, author: author, project: project, to: to) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} archived the #{project.name} project in Operately")
  end

  def assert_project_update_acknowledged_sent(ctx, author: author, to: to) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} acknowledged your status update for #{ctx.project.name}")
  end

  def assert_project_review_acknowledged_sent(ctx, author: author, to: to) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} acknowledged your review for #{ctx.project.name}")
  end

  def assert_project_review_commented_sent(ctx, author: author, to: to) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} commented on a review for #{ctx.project.name}")
  end

  def assert_project_update_commented_sent(ctx, author: author, to: to) do
    ctx |> assert_sent(to: to, subject: "#{Person.short_name(author)} commented on a status update for #{ctx.project.name}")
  end

  defp assert_sent(ctx, to: to, subject: subject) do
    ctx |> UI.assert_email_sent("Operately (#{ctx.company.name}): #{subject}", to: to.email)
  end
end