namespace :dev do
  desc "Configura o ambiente de desenvolvimentp"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate db:seed)
  end

end
