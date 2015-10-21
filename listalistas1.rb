
lista={}

def insertar_principio(el,sub_el,lista)
	if lista[el.to_s]
		lista[el.to_s].push(sub_el)
	else
		lista[el.to_s]=[sub_el]
	end
end

num=1

while num!=15
	
	puts '1 Insertar primero 
3 Mostrar

15 Salir'

	num= gets
	num=num.to_i
	case num
	when 1
		element=gets
		sub_el=gets
		lista=insertar_principio(element.to_s,sub_el,lista)
	when 2
		element=gets
		sub_el=gets
		puts lista.buscar1(element.to_s,sub_el).to_s
	when 3
		puts lista.to_s
	when 4
		lista.eliminar
	when 5
		sub_el=gets
		puts lista.buscar(sub_el.to_s).to_s
	end

end