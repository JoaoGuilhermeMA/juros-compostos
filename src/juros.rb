def calcular_juros_compostos(principal, taxa, tempo, periodo)
  montante = principal * (1 + taxa / (100 * periodo)) ** (tempo * periodo)
  juros = montante - principal
  return montante, juros
end

def exibir_menu
  puts "\nEscolha uma opção:"
  puts "1. Calcular montante e juros"
  puts "2. Calcular apenas o montante"
  puts "3. Calcular apenas os juros"
  puts "4. Sair"
  gets.to_i
end

def obter_dados
  puts "Digite o capital inicial (principal):"
  principal = gets.to_f

  puts "Digite a taxa de juros anual (em %):"
  taxa = gets.to_f

  puts "Digite o tempo em anos:"
  tempo = gets.to_f

  puts "Digite o período de composição (1 para anual, 4 para trimestral, 12 para mensal):"
  periodo = gets.to_i

  return principal, taxa, tempo, periodo
end

loop do
  escolha = exibir_menu

  case escolha
  when 1
    principal, taxa, tempo, periodo = obter_dados
    montante, juros = calcular_juros_compostos(principal, taxa, tempo, periodo)
    puts "Montante final: #{montante.round(2)}"
    puts "Juros compostos acumulados: #{juros.round(2)}"

  when 2
    principal, taxa, tempo, periodo = obter_dados
    montante, _ = calcular_juros_compostos(principal, taxa, tempo, periodo)
    puts "Montante final: #{montante.round(2)}"

  when 3
    principal, taxa, tempo, periodo = obter_dados
    _, juros = calcular_juros_compostos(principal, taxa, tempo, periodo)
    puts "Juros compostos acumulados: #{juros.round(2)}"

  when 4
    puts "Saindo..."
    break

  else
    puts "Opção inválida. Por favor, tente novamente."
  end
end
