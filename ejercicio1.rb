## Ejercicio 1: Escribiendo un archivo básico
# - Crear un método que reciba dos strings, este método creará un archivo index.html y pondrá como párrafo cada uno de los strings recibidos.
# - Crear un método similar al anterior, que además pueda recibir un arreglo. Si el arreglo no está vacío, agregar debajo de los párrafos una lista ordenada con cada uno de los elementos.
# - Crear un tercer método que además pueda recibir un color. Agregar color de fondo a los párrafos.
# - El retorno de los métodos debe devolver nil.

def create_paragraph (x, y)
  file = File.new('./E8CP1A1/index.html', 'w')
  file.puts "<p> #{x} </p>"
  file.puts "<p> #{y} </p>"
  file.close
end

x = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
y = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
create_paragraph(x, y)

def create_list(array)
  file = File.open('./E8CP1A1/index.html', 'a')
  file.puts '<ul>'
  array.each{ |element| file.puts "\t <li> #{element} </li>"}
  file.puts '</ul>'
  file.close
end

array = %w[Element1 Element2 Element3]
create_list(array)

def change_background(color)
  file = File.new('./E8CP1A1/index.html', 'a')
  file.puts "<header>"
  file.puts "\t<style>"
  file.puts "\t\tp {background: #{color}}"
  file.puts "\t</style>"
  file.puts "</header>"
  file.close

end

color = 'green'
change_background(color)
