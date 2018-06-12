def count_lines(filename)
  file = File.open(filename, 'r')
  data = file.readlines
  file.close
  print data.count
end

filename = './E8CP1A1/movies.txt'
count_lines(filename)
