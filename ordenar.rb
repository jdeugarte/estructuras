def burbuja(array)
	for i in 0..(array.length-1)
		for j in 0..(array.length -2)
			if array[j+1]< array[j]
				array[j+1],array[j] = array[j],array[j+1]
			end
		end
	end
	array
end


def seleccion(array)
	for i in 0..(array.length-1)
		posMen=i
		for j in (posMen+1)..(array.length -1)
			if array[j]<array[posMen]
				array[j],array[posMen] = array[posMen],array[j]
			end
		end
	end
	array
end

def insercion(array)
	for i in 0..(array.length-1)
		temp = array[i]
		j=i-1
		while(j>= 0 and array[j]>temp)
			array[j+1] = array[j] 
			j-=1
		end
		array[a+1]=temp
	end
	array
end

file = File.open("numeros.txt", "r")
contents = file.read
puts contents   #=> Lorem ipsum etc.

contents = file.read
puts contents   #=> ""
puts contents.class

