class Pessoa 
	@nome = ""

	def initialize(nome)
		@nome = nome

	def meu_nome
		@nome
	end
end

p1 = params.new("Adriano")
p2 = params.new("Angelica")

puts p1.meu_nome
puts p2.meu_nome