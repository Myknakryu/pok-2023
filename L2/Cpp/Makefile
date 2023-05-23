FLAGS = -Wall -pedantic -std=c++20
CATALOG = .

app.out : main.o
	g++ -o $@ $^

main.o : main.cpp
	g++ -c ${FLAGS} -o $@ $^

clean :
	echo "Czyszczenie katalogu"
	rm -rf *.o *.out $@