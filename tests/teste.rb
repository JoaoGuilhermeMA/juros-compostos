require 'minitest/autorun'

def calcular_juros_compostos(principal, taxa, tempo, periodo)
  montante = principal * (1 + taxa / (100 * periodo)) ** (tempo * periodo)
  juros = montante - principal
  return montante, juros
end

class TesteJurosCompostos < Minitest::Test
  def test_calculo_anual
    montante, juros = calcular_juros_compostos(1000, 5, 1, 1)
    assert_in_delta 1050, montante, 0.01
    assert_in_delta 50, juros, 0.01
  end

  def test_calculo_mensal
    montante, juros = calcular_juros_compostos(1000, 5, 1, 12)
    assert_in_delta 1051.16, montante, 0.01
    assert_in_delta 51.16, juros, 0.01
  end

  def test_calculo_trimestral
    montante, juros = calcular_juros_compostos(1000, 5, 1, 4)
    assert_in_delta 1050.95, montante, 0.01
    assert_in_delta 50.95, juros, 0.01
  end

  def test_calculo_montante_zero
    montante, juros = calcular_juros_compostos(0, 5, 1, 1)
    assert_equal 0, montante
    assert_equal 0, juros
  end

  def test_calculo_taxa_zero
    montante, juros = calcular_juros_compostos(1000, 0, 1, 1)
    assert_equal 1000, montante
    assert_equal 0, juros
  end
end
