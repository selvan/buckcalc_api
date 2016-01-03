# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BuckcalcWeb.Repo.insert!(%BuckcalcWeb.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

users = [
	%{email: "user1@example.com"},
	%{email: "user2@example.com"},
]

analysts = [
	%{email: "analyst1@example.com"},
	%{email: "analyst2@example.com"},
]

questions = [
	{
		asked_by: "user1@example.com", 
		question: %{question: "My tax related question is .."}, 
		answered_by: "analyst1@example.com", 
		chat: [
			{"analyst1@example.com", "answer to your query is .."},
			{"user1@example.com", "ok, if "},
			{"analyst1@example.com", "Yep, that may be "}
		]
	}
]

defmodule Seeds do

	## Insert users
	def insert_users([]), do: nil
	def insert_users([h|t]) do
		changeset = User.changeset(%User{}, h)
		BuckcalcWeb.Repo.insert!(%Country{name: country_name})
		insert_users t
	end

	## Insert questions
end