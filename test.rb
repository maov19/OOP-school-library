File.write('data.txt', 'and my last name is ossa', mode: 'a')

file_data = File.read('data.txt')
puts file_data