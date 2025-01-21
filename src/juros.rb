def calcular_juros_compostos(principal, taxa, tempo)
  montante = principal * (1 + taxa / 100) ** tempo
  juros = montante - principal
  return montante, juros
end

puts "Digite o capital inicial (principal):"
principal = gets.to_f

puts "Digite a taxa de juros anual (em %):"
taxa = gets.to_f

puts "Digite o tempo em anos:"
tempo = gets.to_f

montante, juros = calcular_juros_compostos(principal, taxa, tempo)

puts "Montante final: #{montante.round(2)}"
puts "Juros compostos acumulados: #{juros.round(2)}"

