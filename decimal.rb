=begin 
Crie um programa que dado um valor de 0 a 9999, o mesmo retorne printando na tela linha por linha qual é o Milhar, Centena, Dezena e Unidade.
Exemplo de input: 
4532

Retorno do programa:
  Milhar: 4
  Centena: 5
  Dezena: 3
  Unidade: 2

Regras básicas:
O programa deve ter uma classe chamada Decimal
O método da classe Decimal deve-se chamar retornar_decimais, ao qual recebe um parâmetro: retornar_decimais(integer)
Caso o valor utilizado seja diferente de 0 e 9999, deve retornar um erro genérico com a mensagem "O valor digitado não é um valor válido! Valor digitado: #{integer}"
=end

class Decimal
  def retornar_decimais(integer)
    if integer.to_i.between?(0,9999)
      splitted_integer = integer.to_s.split('').reverse
      puts "Milhar: #{splitted_integer[3]}" unless splitted_integer[3].nil?
      puts "Centena: #{splitted_integer[2]}" unless splitted_integer[2].nil?
      puts "Dezena: #{splitted_integer[1]}" unless splitted_integer[1].nil?
      puts "Unidade: #{splitted_integer[0]}" unless splitted_integer[0].nil?
    else
      raise "O valor digitado não é um valor válido! Valor digitado: #{integer}"
    end
  end
end
