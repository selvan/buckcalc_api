# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BuckcalcApi.Repo.insert!(%BuckcalcApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BuckcalcApi.Repo
import Ecto.Query

alias BuckcalcApi.User
alias BuckcalcApi.Question
alias BuckcalcApi.QRouting
alias BuckcalcApi.QChat


users = [
	%{email: "user1@example.com"},
	%{email: "user2@example.com"},
	%{email: "analyst1@example.com"},
	%{email: "analyst2@example.com"},	
]

questions = [
	%{
		asked_by: "user1@example.com", 
		question: "My tax related question is ..", 
		answered_by: "analyst1@example.com", 
		chat: [
			{"analyst1@example.com", "answer to your query is .."},
			{"user1@example.com", "ok, if "},
			{"analyst1@example.com", "Yep, that may be "}
		]
	}
]

defmodule Seeds do
	## Add users
	def add_users([]), do: nil
	def add_users([h|t]) do
		changeset = User.changeset(%User{}, h)
		BuckcalcApi.Repo.insert!(changeset)
		add_users t
	end

	## Add questions
	def add_questions([]), do: nil
	def add_questions([h|t]) do
		qdata = h
		u=fetch_user(qdata.asked_by)
		changeset = Question.changeset(%Question{}, %{question: qdata.question, asked_by: u.id})
		q=BuckcalcApi.Repo.insert!(changeset)
		r=add_routing(q, qdata.answered_by)
		add_chat(r, qdata.chat)
		add_questions(t)
	end

	## Add routing
	def add_routing(q, answered_by_email) do
		u=fetch_user(answered_by_email)
		changeset = QRouting.changeset(%QRouting{}, %{question_id: q.id, answered_by: u.id})
		BuckcalcApi.Repo.insert!(changeset)	
	end

	## Add Chat
	def add_chat(_, []), do: nil
	def add_chat(r, [h|t]) do
		{sender_email, body} = h
		u=fetch_user(sender_email)
		changeset = QChat.changeset(%QChat{}, %{qrouting_id: r.id, body: body, sent_by: u.id})
		BuckcalcApi.Repo.insert!(changeset)	
		add_chat(r, t)
	end

	defp fetch_user(email) do
		User |> where([u], u.email== ^email) |> Repo.all |> List.first
	end

	def reset_db do
		QChat |> Repo.delete_all
		QRouting |> Repo.delete_all
		Question |> Repo.delete_all
		User |> Repo.delete_all	
	end
end

Seeds.reset_db
Seeds.add_users(users)
Seeds.add_questions(questions)
