require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "debe poder crear un post" do
  	post = Post.create(titulo: "Mi titulo", contenido: "Mi contenido >:)", extension: "jpg")
  	assert post.save
  end
  test "debe actualizar un post" do 
  	post = posts(:primero)
  	assert post.update(titulo: "Nuevo titulo", contenido: "Nuevo contenido >:)")
  end
  test "debe borrar un post" do
  	post = posts(:primero)
  	post.destroy
  	assert_raise(ActiveRecord::RecordNotFound) { Post.find(post.id) }
  end
  test "debe encontrar un post" do 
  	id = posts(:primero).id
  	assert_nothing_raised { Post.find(id) }
  end
  test "no debe crear un post sin titulo" do 
  	post = Post.new
  	assert post.invalid?
  end
  test "cada titulo del post debe ser unico" do 
  	post = Post.new
  	post.titulo = posts(:primero).titulo
  	assert post.invalid?
  end
end
