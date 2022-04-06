# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Coin.create!(
	description: "Bitcoin",
	acronym: "BTC",
	url_image: "https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png"
)

Coin.create!(
	description: "Ethereum",
	acronym: "ETH",
	url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN0845__VdjAcgn4uInmN1uM3UPCKnU6fyLg&usqp=CAU"
)

Coin.create!(
	description: "Dash",
	acronym: "DASH",
	url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYpOTpIy_IIvpAkRtqixrMtIz4yQ03zIDcRvCzdenxQhRBSJF7DVdHpEuIbvEaKeo-t5k&usqp=CAU"
)