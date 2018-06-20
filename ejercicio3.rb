# ## Ejercicio 3: Contando palabras
#
# - Crear un método que reciba el archivo peliculas.txt, lo abra y cuente la cantidad total de palabras. El método debe devolver este valor.
# - Crear un método similar para que además reciba -como argumento- un *string*. En este caso el método debe contar únicamente las apariciones de ese *string* en el archivo.


def count_words(filename)
  file = File.open(filename, 'r')
  data = file.readlines
  file.close
  text = data.join
  words = text.split.length
  print "Hay exactamente #{words} palabras"
end

filename = './E8CP1A1/movies.txt'
count_words(filename)

def count_similar_word(filename, word)
  file = File.open(filename, 'r')
  data = file.readlines
  file.close
  text = data.join.downcase.delete('.')
  words = text.split
  matches = words.select { |element| element == word }
  frequency = matches.length
  if words == 1
    puts "La palaraba #{word} se repite #{frequency} vez"
  else
    puts "La palaraba #{word} se repite #{frequency} veces"
  end
end

puts ""
count_similar_word(filename, "galaxias")
