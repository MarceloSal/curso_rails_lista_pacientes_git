namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o BD...") {%x(rails db:drop)}
      show_spinner("Criando o BD...") {%x(rails db:create)}
      show_spinner("Migrando o BD...") {%x(rails db:migrate)}
      %x(rails dev:add_categories)
      %x(rails dev:add_patientlists)
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra os pacientes"
  task add_patientlists: :environment do
    show_spinner("Cadastrando os pacientes") do
      patientlists = 
                    [
                      {
                        register_name: "Marcelo",
                        email: "marcelo@marcelo.com",
                        category: Category.find_by(description: 'adulto')
                      },

                      {
                        register_name: "João",
                        email: "joao@joao.com",
                        category: Category.find_by(description: 'idoso')
                      },
                      


                      {
                        register_name: "Lucas",
                        email: "lucas@lucas.com",
                        category: Category.find_by(description: 'criança')
                      },
                      


                      {
                        register_name: "Marcos",
                        email: "marcos@marcos.com",
                        category: Category.find_by(description: 'adulto')
                      }
                    ]

      patientlists.each do |patientlist|
        Patientlist.find_or_create_by!(patientlist)
      end
    end
  end

  desc "Cadastra a categoria dos pacientes"
  task add_categories: :environment do
    show_spinner("Cadastrando a categoria dos pacientes") do
      categories = 
                    [
                      {description: "criança"},
                      {description: "adulto"},
                      {description: "idoso"}
                    ]
      categories.each do |category|
        Category.find_or_create_by!(category)
      end  
    end
  end              

  private

  def show_spinner(start_msg, final_msg = "Concluído com sucesso!")
      spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
      spinner.auto_spin
      yield
      spinner.success("(#{final_msg})")
  end
end
