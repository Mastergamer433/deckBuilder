.PHONY: clean run
CXX := g++
CXXFLAGS := -l libssl -l libcrypto
LINKFLAGS := 
OBJS_DIR = obj/
BUILD_DIR = build/
SOURCE_DIR := src/
EXEC := main
SOURCE_FILES := $(wildcard $(SOURCE_DIR)/*.cpp)
SOURCE_HEADERS := $(wildcard $(SOURCE_DIR)/*.h)
OBJS := $(patsubst $(SOURCE_DIR)/%.cpp,$(OBJS_DIR)/%.o,$(SOURCE_FILES))

$(EXEC): $(OBJS)
	$(CXX) $(OBJS) $(CXXFLAGS) $(LINKFLAGS) -o $(BUILD_DIR)/$(EXEC)

$(OBJS_DIR)/%.o : $(SOURCE_DIR)/%.cpp
	mkdir $(OBJS_DIR)/ -p
	$(CXX) $(CXXFLAGS) -c $< -o $@

#Files to be compiled
$(OBJS_DIR)/main.o: $(SOURCE_FILES) $(SOURCE_HEADERS)

run:
	./build/main

clean:
	rm $(OBJS_DIR)/*.o 
	rm $(BUILD_DIR)/$(EXEC)
