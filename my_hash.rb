require_relative 'lista8'

class MyHash
	attr_reader :colisiones

	def initialize(tamano)
		@tamano = tamano
		@array = Array.new(tamano) { Lista8.new}
		@colisiones=0
		puts @array[0].class
	end

	def dispercion(elem)
		i=0
		cont=0
		while i<elem.length
			cont= cont +elem[i].ord**(i+1)
			i+=1
		end

		a=cont % @tamano
		a
	end
	
	
	def insertar(elem)
		if @array[dispercion(elem)].insertar_contando(elem)
			@colisiones+=1
		end
	end

	def eliminar(elem)
		@array[dispercion(elem)].eliminar(elem)
	end

	def buscar(elem)
		@array[dispercion(elem)].buscar(elem)
	end

	def mostrar
		@array.each do |a|
			a.mostrar
		end
	end
	
end
hash = MyHash.new(1117)

file = File.open("cien años de soledad.txt", "r")
contents = file.read
puts contents.class
#contents = contents.gsub!(/[^0-9A-Za-z]/, '')
if ! contents.valid_encoding?
  s = contents.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
  array =s.split(' ')
end

#puts array.to_s

array.each do |word|
	hash.insertar(word)
end
hash.mostrar
puts array.length
num=0
while num!=15
	
	puts ' 
2 Buscar
3 Contar colisiones
15 Salir'

	num= gets
	num=num.to_i
	case num
	when 2
		element=gets
		puts hash.buscar(element.to_s).to_s
	when 3
		puts hash.colisiones
	end
end