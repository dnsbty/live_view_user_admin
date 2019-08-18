# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserAdmin.Repo.insert!(%UserAdmin.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias UserAdmin.Repo
alias UserAdmin.Users.Role

roles = ~w(Administrator Moderator Editor User Guest)

Enum.each(roles, fn name ->
  Repo.insert!(%Role{name: name})
end)
