class Tripla

	attr_accessor :el,:ant, :sig
	def initialize(el, ant, sig)
		@el=el
		@ant=ant
		@sig=sig
	end
	
	
end


class Lista8

	attr_accessor :primero, :ultimo
	def initialize
		@primero=nil
		@ultimo=nil
	end

	def insertar_primero(el)
			if @primero==nil
				@primero= Tripla.new(el,nil, nil)
				@ultimo=@primero
				false
			else
				aux=@primero
				@primero= Tripla.new(el,nil,aux)
				aux.ant=@primero
				true
			end
		
	end

	def insertar_contando(el)
		if !buscar(el)
			insertar_primero(el)


		end
	end

	def insertar_final(el)
		if @primero==nil
			@primero= Tripla.new(el,nil, nil)
			@ultimo=@primero
		else
			aux=@ultimo
			@ultimo= Tripla.new(el,aux,nil)
			aux.sig=@ultimo
		end
	end

	def eliminar_primero
		if @primero!=nil
			if @primero.sig
				@primero.sig.ant=nil
				@primero=@primero.sig
			else
				@primero=nil
				@ultimo=nil
			end			
		end
	end

	def eliminar_final
		if @ultimo!=nil
			if @ultimo.ant
				@ultimo.ant.sig=nil
				@ultimo=@ultimo.ant
			else
				@ultimo=nil
				@primero=nil
			end
		end
	end

	def eliminar(elem)
		aux=@primero
		while aux!=@ultimo
			if aux.el== elem
				aux2=aux.sig
				aux2.ant=aux.ant
				aux.ant.sig=aux2
				return true
			end
			aux=aux.sig
		end
		if aux.el== elem
			aux2=aux.ant
			aux2.sig=nil
			return true
		end
		false
	end

	def menor
		aux=@primero
		menor=@primero
		while aux!=@ultimo
			if menor.el> aux.sig.el
				menor=aux.sig
			end
			aux=aux.sig
		end
		menor.el
	end

	def menor_rec(aux,menor)
		if aux!=@ultimo
			siguiente= menor_rec(aux.sig,menor)
			if menor.el>siguiente.el
				menor=siguiente
			end
		else
			if menor.el>@ultimo.el
				menor=@ultimo
			end
		end
		menor
	end

	def insertar_en_su_lugar(el)
		aux=@primero
		flag=true
		if @primero!=nil
			if el<@primero.el
				aux2=Tripla.new(el,nil,@primero)
				@primero.ant=aux2
				@primero=aux2
			end
			while aux!=@ultimo
				if aux.el<=el and flag==true and aux.sig.el>el
					aux2=Tripla.new(el,aux,aux.sig)
					aux.sig.ant=aux2
					aux.sig=aux2


				end
				aux=aux.sig
			end
			if aux.el<=el and flag==true
				aux2=Tripla.new(el,aux,nil)
				aux.sig=aux2
				@ultimo=aux2
			end
		else
			insertar_primero(el)
		end
	end

	def ordenar
		if @primero!=nil
			lista=Lista8.new
			aux=@primero
			while aux!=@ultimo
				el=aux.el
				lista.insertar_en_su_lugar(el)
				aux=aux.sig
			end
			el=aux.el
			lista.insertar_en_su_lugar(el)
			@primero=lista.primero
			@ultimo=lista.ultimo
		end
	end

	def invertir
		aux=@primero
		while aux!=@ultimo
			auxp=aux.sig
			aux.sig=aux.ant
			aux.ant=auxp

			aux=aux.ant
		end
		auxp=aux.sig
		aux.sig=aux.ant
		aux.ant=auxp

		aux=@primero
		@primero=@ultimo
		@ultimo=aux

	end
	
	def mostrar
		if primero!=nil
			aux=@primero
			puts '====='
			while aux != @ultimo
				puts aux.el.to_s
				aux = aux.sig
			end
			puts aux.el.to_s
			puts '====='
		else
			puts'======'
		end
	end

	def buscar(el)
	if primero!=nil
		aux=@primero
		while aux != @ultimo
			if aux.el==el
				return true
			end
			aux=aux.sig
		end
		if aux.el==el
			return true
		end
		return false
	end
	end
	
end

=begin
lista=Lista8.new
num = 0

while num!=15
	
	puts '1 Insertar primero 
2 Insertar final
3 Eliminar principio
4 Eliminar final
5 menor rec
6 Menor no recursivo
7 Mostrar lista
8 insertar en su lugar
9 invertir
15 Salir'

	num= gets
	num=num.to_i
	case num
	when 1
		element=gets
		lista.insertar_primero(element.to_i)
	when 2
		element=gets
		lista.insertar_final(element.to_i)
	when 3
		lista.eliminar_primero
	when 4
		lista.eliminar_ultimo
	when 5
		puts lista.menor_rec(lista.primero,lista.primero).el.to_s
	when 6
		puts lista.menor.to_s
	when 7
		lista.mostrar
	when 8
		el=gets
		lista.insertar_en_su_lugar(el.to_i)
	when 9
		lista.invertir
	when 10
		lista.ordenar
	when 0
		puts lista.menor_rec(lista.inicio,lista.lista[lista.inicio]).to_s
	end

end
=end
