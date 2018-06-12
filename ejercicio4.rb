option = 0
while option != 6
  puts '--------------------------------------------------------'
  puts 'Bienvenidos, ingrese algunas de las siguientes opciones:'
  puts '--------------------------------------------------------'
  puts '1-. Existencias'
  puts '2-. Stock por producto'
  puts '3-. Productos No Registrados por Bodega'
  puts '4-. Productos con el mínimo stock'
  puts '5-. Registrar nuevo producto'
  puts '6-. Salir'
  option = gets.chomp.to_i
  if option == 1
    sub_option = ''
    while sub_option != 'd'
      puts '--------------------------------------------------------'
      puts 'Verifique las existencias:'
      puts '--------------------------------------------------------'
      puts 'a) Mostrar la existencia por productos'
      puts 'b) Mostrar la existencia total por tienda'
      puts 'c) Mostrar la existencia total en todas las tiendas'
      puts 'd) Volver al menú principal'
      sub_option = gets.chomp.to_s
      file = File.open('products.txt', 'r')
      data = file.readlines
      file.close
      if sub_option == 'a'
        puts '--------------------------------------------------------'
        puts 'Existencias por producto:'
        data = data.map { |e| e.split(', ').map(&:chomp) }
        data.each do |e|
          stock = e[1].to_i + e[2].to_i + e[3].to_i
          puts "#{e[0]}: #{stock}"
        end
        puts '--------------------------------------------------------'
      elsif sub_option == 'b'
        puts '--------------------------------------------------------'
        puts 'Existencias por bodega'
        sum1 = data.inject(0) { |b, e| b + e.split(' ')[1].to_i }
        sum2 = data.inject(0) { |b, e| b + e.split(' ')[2].to_i }
        sum3 = data.inject(0) { |b, e| b + e.split(' ')[3].to_i }
        puts "Bodega 1: #{sum1}"
        puts "Bodega 2: #{sum2}"
        puts "Bodega 3: #{sum3}"
        puts '--------------------------------------------------------'
      elsif sub_option == 'c'
        puts '--------------------------------------------------------'
        puts 'Existencia total en bodegas:'
        # mejorar codigo
        data = data.map { |e| e.split(', ').map(&:chomp) }
        stock = 0
        data.each do |e|
          stock += e[1].to_i + e[2].to_i + e[3].to_i
        end
        puts "El inventario total en bodega es  de #{stock} unidades"
        puts '--------------------------------------------------------'
      else
        puts 'Ha ingresado mal la opción, intente de nuevo'
      end
    end
  elsif option == 2
    file = File.open('products.txt', 'r')
    data = file.readlines.map(&:chomp)
    data = data.map { |e| e.split(', ') }
    file.close
    puts '--------------------------------------------------------'
    puts 'Ingrese el nombre del producto'
    product = gets.chomp.to_s
    searching_product = data.select { |e| e.first == product }
    if searching_product != []
      puts "El stock del #{product} es:"
      puts "Bodega 1: #{searching_product[0][1]}"
      puts "Bodega 2: #{searching_product[0][2]}"
      puts "Bodega 3: #{searching_product[0][3]}"
      puts '--------------------------------------------------------'
    else
      puts "el #{product} no existe. Intente mas tarde"
    end
  elsif option == 3
    file = File.open('products.txt', 'r')
    data = file.readlines.map(&:chomp)
    data = data.map { |e| e.split(', ') }
    file.close
    puts '--------------------------------------------------------'
    puts 'Estado de productos no registrados (NR) por bodega'
    store1 = data.select { |e| e[1] == 'NR' }.length
    store2 = data.select { |e| e[2] == 'NR' }.length
    store3 = data.select { |e| e[3] == 'NR' }.length
    puts "Bodega 1: #{store1} productos NR"
    puts "Bodega 2: #{store2} productos NR"
    puts "Bodega 3: #{store3} productos NR"
    puts '--------------------------------------------------------'
  elsif option == 4
    file = File.open('products.txt', 'r')
    data = file.readlines.map(&:chomp)
    data = data.map { |e| e.split(', ') }
    file.close
    puts '--------------------------------------------------------'
    puts 'Ingrese por favor el stock minimo esperado'
    stock_minimo = gets.chomp.to_i
    puts '--------------------------------------------------------'
    puts "Los productos con stock inferior a #{stock_minimo}"
    stock = 0
    data.select do |e|
      stock = e[1].to_i + e[2].to_i + e[3].to_i
      puts "#{e[0]}: #{stock}" if stock < stock_minimo
    end
    puts '--------------------------------------------------------'
  elsif option == 5
    puts '--------------------------------------------------------'
    puts 'Ingrese un nuevo producto:'
    puts 'Nombre:'
    name = gets.chomp.to_s
    puts 'Stock en Bodega 1:'
    stock_s1 = gets.chomp.to_i
    puts 'Stock en Bodega 2:'
    stock_s2 = gets.chomp.to_i
    puts 'Stock en Bodega 3:'
    stock_s3 = gets.chomp.to_i
    file = File.open('products.txt', 'a')
    file.puts "#{name}, #{stock_s1}, #{stock_s2}, #{stock_s3}"
    file.close
  end
end
puts '--------------------------------------------------------'
puts 'Ha salido del programa'
puts '--------------------------------------------------------'
