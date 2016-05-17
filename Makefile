.PHONY: all fat clean
TARGET = tbdump
FAT = $(TARGET)-fat
MULTI = $(FAT).x86_64 $(FAT).armv7 $(FAT).arm64
SRC = src/*.c
CFLAGS += -std=c99 -Wall -O3 -DTIMESTAMP="`date +'%d. %B %Y %H:%M:%S'`"

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

fat: $(FAT)

$(FAT): $(MULTI)
	lipo -create -output $(FAT) $(MULTI)
	codesign -s - $(FAT)

$(FAT).x86_64: $(SRC)
	xcrun -sdk macosx clang $(CFLAGS) -arch x86_64 -o $(FAT).x86_64 $(SRC)

$(FAT).armv7: $(SRC)
	xcrun -sdk iphoneos clang $(CFLAGS) -arch armv7 -o $(FAT).armv7 $(SRC)

$(FAT).arm64: $(SRC)
	xcrun -sdk iphoneos clang $(CFLAGS) -arch arm64 -o $(FAT).arm64 $(SRC)

clean:
	rm -f $(TARGET) $(FAT) $(MULTI)
