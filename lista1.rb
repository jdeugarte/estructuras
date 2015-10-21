class Lista1 
	attr_accessor :tamano, :lista, :inicio,:final
	def initialize(tamano)
		@tamano=tamano
		@lista=Array.new(tamano)
		@inicio=-1
		@final= -1
	end
	
	def insertar_primero(elemento)
		if @inicio==0
			if @final!=@tamano-1
				@inicio=@tamano-1
				@lista[@inicio]=elemento
			else
				nil
			end
		elsif @inicio>0
			if @final!=@inicio-1
				@inicio-=1
				@lista[@inicio]=elemento
			else
				nil
			end
		end
		if @inicio == -1
			@inicio=0
			@final=0
			@lista[@inicio]=elemento
		end
	end

	def insertar_final(elemento)
		if @final==@tamano-1
			if @final!=0
				@final=0
				@lista[@final]=elemento
			else
				nil
			end
		elsif @final!=@tamano-1 and @final!=-1
			if @final!=@inicio-1
				@final+=1
				@lista[@final]=elemento
			else
				nil
			end
		end
		if @final==-1
			@final=0
			@inicio=0
			@lista[@final]=elemento
		end

	end

	def eliminar_primero
		if @inicio==@tamano-1
			@inicio=0
		else
			@inicio+=1
		end
	end

	def eliminar_ultimo
		if @final==0
			@ultimo=@tamano-1
		else
			@final-=1	
		end
	end
	
	def menor
		puntero=@inicio
		menor=@lista[@inicio]
		while puntero!=@final
			if puntero==@tamano-1
				if menor>@lista[0]
					menor=lista[0]
				end
				puntero=0
			else
				if menor>@lista[puntero+1]
					menor=@lista[puntero+1]
				end
				puntero+=1
			end
		end
		menor
	end

	def menor_rec(puntero,menor)
		if puntero==@final
			if menor>@lista[puntero]
				return @lista[puntero]
			else
				return menor
			end
		else
			if puntero!= @tamano-1
				if menor>menor_rec(puntero+1,menor)
					return @lista[puntero]
				else
					return menor
				end
			else
				if menor>menor_rec(0,menor)
					return @lista[puntero]
				else
					return menor
				end
			end
		end
	end

	def invertir
		a=[]
		puntero=@inicio
		while puntero!=@final
			a.push(@lista[puntero])
			if puntero==@tamano-1
				puntero=0
			else
				puntero+=1
			end
		end
		puts @lista[@final]
		a.push(@lista[@final])
		@inicio=-1
		@final=-1
		a.each do |i|
			self.insertar_primero(i)
		end
		a
	end

	def mostrar_lista
		puts '========='
		puntero=@inicio
		while puntero!=@final
			puts @lista[puntero].to_s
			if puntero==@tamano-1
				puntero=0
			else
				puntero+=1
			end
		end
		puts @lista[@final]
		puts '======='
	end

	def mostrar_vector
		@lista.each do |i|
			puts i.to_s
		end
	end
end

lista=Lista1.new(10000)
num = 0

while num!=9
	
	puts '1 Insertar primero 
2 Insertar final
3 Eliminar principio
4 Eliminar final
5 Invertir
6 Menor no recursivo
7 Mostrar lista
8 Mostrar vector
9 Salir'

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
		lista.invertir
	when 6
		puts lista.menor.to_s
	when 7
		lista.mostrar_lista
	when 8
		lista.mostrar_vector
	when 0
		puts lista.menor_rec(lista.inicio,lista.lista[lista.inicio]).to_s
	end

end