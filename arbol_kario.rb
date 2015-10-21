class Nodo

	attr_accessor :elem, :hermano,:primer_hijo

	def initialize(elem,hermano,primer_hijo)
		@elem=elem
		@hermano=hermano
		@primer_hijo=primer_hijo
	end
	
	
end

class ArbolKario

	attr_accessor :raiz

	def initialize
		@raiz=nil
	end
	
	def agregar_hijo(elem,padre,raiz)
		if !@raiz
			aux=Nodo.new(elem,@raiz,nil)
			@raiz=Nodo.new(padre,nil,aux)
		else
			if raiz.elem==padre
				if !raiz.primer_hijo
					raiz.primer_hijo=Nodo.new(elem,nil,nil)
				else
					aux=Nodo.new(elem,raiz.primer_hijo,nil)
					raiz.primer_hijo=aux
				end
			else
				if raiz.hermano
					agregar_hijo(elem,padre,raiz.hermano)
				end
				if raiz.primer_hijo
					agregar_hijo(elem,padre,raiz.primer_hijo)
				end
			end
		end
	end

	def mostrar_nivel(raiz,hijo,elem)
		print elem
		if elem==raiz.
			
		end
	end

	def mostrar(raiz)
		print raiz.elem.to_s.chomp
		
		if raiz.primer_hijo
			mostrar_nivel(raiz, raiz.primer_hijo)
		else

		end

	end
	
end

arbol=ArbolKario.new
num = 0

while num!=9
	
	puts '1 Insertar 
2  mostrar
9 Salir'

	num= gets
	num=num.to_i
	case num
	when 1
		padre=gets
		element=gets
		arbol.agregar_hijo(element,padre,arbol.raiz)
	when 2
		arbol.mostrar(arbol.raiz)
	end

end