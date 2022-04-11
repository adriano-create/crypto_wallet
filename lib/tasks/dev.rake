namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?

      show_spinner("Apagando DB..") { %x(rails db:drop) }
      show_spinner("Criando DB..") { %x(rails db:create) }
      show_spinner("Migrando DB..") { %x(rails db:migrate) }
      %x(rails dev:add_coins) 
      %x(rails dev:add_mining_type)
    else 
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end


  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas..") do
      coins = [
                {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTUL3-zKr5g8yQTCjOw9k3XGDm5n7rhnW5JQ&usqp=CAU",
                  mining_type: MiningType.find_by(acronym: 'poW')
                },

                { 
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN0845__VdjAcgn4uInmN1uM3UPCKnU6fyLg&usqp=CAU",
                  mining_type: MiningType.all.find_by(acronym: 'poW')
                },

                {
                  description: "Dash",
                  acronym: "DASH",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA_vuIbMewi_fj2HJaxlqJbOz937hkq_NHvA&usqp=CAU",
                  mining_type: MiningType.all.sample
                },

                {
                  description: "Iota",
                  acronym: "IOT",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrLVVMCkoYG2SNnWXHkYOTCdReI_bZbQGKERbi0Vd8ed588q9VFGursmE-RsMzfDbBrF4&usqp=CAU",
                  mining_type: MiningType.all.sample
                },

                {
                  description: "ZEC",
                  acronym: "DASH",
                  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwXY5GL4nSEQsfAn31xzNL2eU38qagdvy_jg&usqp=CAU",
                  mining_type: MiningType.all.sample
                }
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end 

  desc "Cadastra os tipos de mineração"
  task add_mining_type: :environment do
    show_spinner("Cadastra os tipos de mineração..") do
      mining_types = [
        {description: "proof os Work", acronym: "poW"},
        {description: "proof os Stake", acronym: "poS"},
        {description: "proof os Capacity", acronym: "poC"}         
      ]


      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end



