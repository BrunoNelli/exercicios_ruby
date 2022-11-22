require "minitest/autorun"
require 'pry'
require  "./variables"
require "./array"
require './hash'
require './array_of_hashes'
require './methods'

class Evaluate < Minitest::Test
  def test_variables
    assert_instance_of(String, $string, "A variável $string deve ser do tipo String")
    assert_instance_of(Integer, $integer, "A variável $integer deve ser do tipo Integer")
    assert_instance_of(Float, $float, "A variável $float deve ser do tipo Float")
  end

  def test_array
    assert_instance_of(Array, $frutas, "A variável $frutas deve ser do tipo Array")
    refute_empty($frutas, "O array $frutas não deve ser vazio")
    assert($frutas.all? { |fruta| fruta.instance_of?(String)}, "Todos os elementos da variável $frutas devem ser uma string. Array atual: #{$frutas} ")
    assert($frutas.size == 5, "A variável $frutas deve ter cinco elementos. Tamanho atual: #{$frutas.size} Frutas: #{$frutas}")
  end

  def test_hash
    assert_instance_of(Hash, $aluno, "A variável $aluno deve ser do tipo Hash. Exemplo: $aluno = {alguma_coisa: 'outra coisa'}")
    refute_empty($aluno, "O Hash $aluno não deve ser vazio. Exemplo: $aluno = {alguma_coisa: 'outra coisa'}")
    assert($aluno.keys.one? { |key| key == :nome}, "A variável $aluno deve ter uma chave com nome ':nome'. Chaves atuais: #{$aluno.keys}")
    assert_instance_of(String, $aluno[:nome], "O valor da variável $aluno[:nome] deve ser uma String. Exemplo: $aluno = { nome: 'Bruno' } Valor atual: #{$aluno[:nome]}")
    assert($aluno.keys.one? { |key| key == :idade}, "A variável $aluno deve ter uma chave com nome ':idade'. Chaves atuais: #{$aluno.keys}")
    assert_instance_of(Integer, $aluno[:idade], "O valor da variável $aluno[:idade] deve ser um Integer. Exemplo: $aluno = { idade: 29 } Valor atual: #{$aluno[:idade]}")
    assert($aluno.keys.one? { |key| key == :altura}, "A variável $aluno deve ter uma chave com nome ':altura'. Chaves atuais: #{$aluno.keys}")
    assert_instance_of(Float, $aluno[:altura], "O valor da variável $aluno[:altura] deve ser um Float. Exemplo: $aluno = { altura: 1.74 } Valor atual: #{$aluno[:altura]}")
  end

  def test_array_of_hashes
    assert_instance_of(Array, $carros, "A variável $carros deve ser do tipo Array. Exemplo: $carros = [ {alguma_coisa: 'outra coisa'} ]")
    assert($carros.none? { |carro| carro.empty? }, "O Array de Hashes $carros não deve ser vazio. Exemplo: $carros = [ {alguma_coisa: 'outra coisa'} ]")
    assert($carros.all? { |carro| carro.key?(:marca) }, "A variável $carros deve ter uma chave com nome ':marca' em cada Array. Exemplo: $carros = [ { marca: 'Hyundai' } ] Chaves e valores atuais: #{$carros}")
    assert($carros.all? { |carro| carro[:marca].class == String }, "O valor da variável $carros[:marca] deve ser uma String. Exemplo: $carros = [ { marca: 'Hyundai' } ] Chaves e valores atuais: #{$carros}")
    assert($carros.all? { |carro| carro.key?(:modelo) }, "A variável $carros deve ter uma chave com nome ':modelo' em cada Array. Exemplo: $carros = [ { marca: 'Hyundai', modelo: 'Creta' } ] Chaves e valores atuais: #{$carros}")
    assert($carros.all? { |carro| carro[:modelo].class == String }, "O valor da variável $carros[:modelo] deve ser uma String. Exemplo: $carros = [ { marca: 'Hyundai', modelo: 'Creta' } ] Chaves e valores atuais: #{$carros}")
    assert($carros.all? { |carro| carro.key?(:motor) }, "A variável $carros deve ter uma chave com nome ':motor' em cada Array. Exemplo: $carros = [ { marca: 'Hyundai', modelo: 'Creta', motor: 2.0 } ] Chaves e valores atuais: #{$carros}")
    assert($carros.all? { |carro| carro[:motor].class == Float }, "O valor da variável $carros[:motor] deve ser um Float. Exemplo: $carros = [ { marca: 'Hyundai', modelo: 'Creta', motor: 2.0 } ] Chaves e valores atuais: #{$carros}")
    assert($carros.size >= 3, "O Array $carros deve ter pelo menos 3 carros(Hashes). Exemplo: $carros = [ { marca: 'Hyundai', modelo: 'Creta', motor: 2.0 }, { marca: 'Nissan', modelo: 'Versa', motor: 1.8 }, { marca: 'Fiat', modelo: 'Palio', motor: 1.0 } ]")
  end

  def test_methods
    metodos = Metodos.new
    assert(Metodos.method_defined?(:hello_world), 'O método hello_world não existe! Tenha certeza que O método hello_world foi criado ou digitado corretamente')
    assert(Metodos.method_defined?(:boas_vindas), 'O método boas_vindas não existe! Tenha certeza que O método boas_vindas foi criado ou digitado corretamente')
    assert_output(/Hello World!/) { metodos.hello_world }
    assert_output(/Olá Bruno! Seja bem-vindo!/) { metodos.boas_vindas('bruno') }
  end
end
