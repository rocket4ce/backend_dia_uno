require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "debe poder crear un usuario" do
  	u = Usuario.new(username: "uriel", email: "misupermail@mail.com", password: "12345678")
  	assert u.save
  end
  test "debe crear usuario sin email" do
  	u = Usuario.new(username: "uriel", password:"12345678")
  	assert u.save, "No se guardo el usuario"
  end
end
