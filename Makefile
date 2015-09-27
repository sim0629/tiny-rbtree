CFLAGS = -Wall -Wextra -Werror=implicit-function-declaration

all: rbtree.c
	$(CC) -DNDEBUG -O3 $(CFLAGS) $^ -o bin

debug: rbtree.c
	$(CC) -g $(CFLAGS) $^ -o bin

klee: rbtree.c
	llvm-gcc -I ../klee/include $(CFLAGS) -emit-llvm -c -g $^ -o rbtree.bc
