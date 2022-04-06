class WelcomeController < ApplicationController
  def index
    @meu_nome = "Adriano"
    @curso = "Rails"
  end
end
