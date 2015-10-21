require_relative 'lista8'

class Nodo

	attr_accessor :el,:ant, :sig,:categoria
	def initialize(el, ant, sig, categoria)
		@el=el
		@ant=ant
		@sig=sig
		@categoria=categoria
	end
	
	
end

class Listalistas
	def initialize()
		@primero=nil
		@ultimo=nil
	end
	
	def insertar_principio(el, sub_el)
		flag=true
		if @primero==nil
			lista=Lista8.new()
			lista.insertar_primero(sub_el)
			@primero= Nodo.new(lista,nil,nil, el)
			@ultimo=@primero
		else
			aux=@primero
			while aux!=@ultimo
				if aux.categoria==el
					aux.el.insertar_primero(sub_el)
					flag=false
				end
				aux=aux.sig
			end
			
			if aux.categoria==el
				aux.el.insertar_primero(sub_el)
				flag=false
			end
			if flag==true
				lista=Lista8.new()
				lista.insertar_primero(sub_el)
				aux2=@primero
				@primero= Nodo.new(lista,nil,@primero,el)
			end
		end
	end
		
	def buscar1(el,sub_el)
		if @primero
			aux=@primero
			while aux!=@ultimo
				if aux.categoria==el
					return aux.el.buscar(sub_el)
				end
				aux=aux.sig
			end
			if aux.categoria==el
				return aux.el.buscar(sub_el)
			end
			return false
		else
			return false
		end
	end

	def mostrar
		if @primero
			aux=@primero
			while aux !=@ultimo
				puts aux.categoria.to_s
				aux.el.mostrar
				aux=aux.sig
			end
			puts aux.categoria.to_s
			aux.el.mostrar
		end
	end

	def eliminar
		@primero=nil
		@ultimo=nil
	end

	def buscar(sub_el)
		if @primero
			aux=@primero
			while aux!=@ultimo
				if aux.el.buscar(sub_el)
					puts aux.categoria.to_s
				end
				aux=aux.sig
			end
			if aux.el.buscar(sub_el)
				puts aux.categoria.to_s
			end
		end
	end

end

lista=Listalistas.new
num = 0

while num!=15
	
	puts '1 Insertar primero 
2 Buscar
3 Mostrar
4 Eliminar
5 Mostrar Platos que tengan x elemento
15 Salir'

	num= gets
	num=num.to_i
	case num
	when 1
		element=gets
		sub_el=gets
		lista.insertar_principio(element.to_s,sub_el)
	when 2
		element=gets
		sub_el=gets
		puts lista.buscar1(element.to_s,sub_el).to_s
	when 3
		lista.mostrar
	when 4
		lista.eliminar
	when 5
		sub_el=gets
		puts lista.buscar(sub_el.to_s).to_s
	end

end