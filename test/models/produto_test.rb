require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  test 'save nil produto' do
    p = Produto.new
    assert_not p.valid?, 'Saves empty Produto'
  end

  test 'valid valor' do
    p = produtos :teste
    p.valor = 0
    assert_not p.valid?, 'salva valor == 0'
    p.valor = -1
    assert_not p.valid?, 'salva valor < 0'
  end

  test 'name not nil' do
    p = produtos :teste
    p.nome = ''
    assert_not p.valid?, 'salva com nome vazio'
    p.nome = nil
    assert_not p.valid?, 'salva com nome nil'
  end

  test 'valor is numeral' do
    p = produtos :teste
    p.valor = 'teste'
    assert_not p.valid?, 'salva valor sem ser numeral'
  end

  test 'saves produto' do
    assert produtos(:teste).valid?, 'nao salva produto valido'
  end

end
