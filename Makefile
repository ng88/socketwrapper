cc = g++

CFLAGS = -std=c++17 -lpthread -fpic -Iinclude

SRCDIR = src
SRCFILES = $(wildcard $(SRCDIR)/*.cpp)
OBJDIR = src
OBJFILES = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCFILES))

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(cc) -c $< -o $@ $(CFLAGS)

.PHONY: all
all: static shared

.PHONY: static
static: $(OBJFILES)
	ar rcs libsocketwrapper.a $^
	rm -rf $(OBJDIR)/*.o

.PHONY: shared
shared: $(OBJFILES)
	$(cc) -shared -o libsocketwrapper.so $^

.PHONY: clean
clean:
	rm -rf $(OBJDIR)/*.o libsocketwrapper.*

