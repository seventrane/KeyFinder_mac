cmd_Release/obj.target/addon/audio_reader.o := c++ -o Release/obj.target/addon/audio_reader.o ../audio_reader.cpp '-DNODE_GYP_MODULE_NAME=addon' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-D_GLIBCXX_USE_CXX11_ABI=1' '-D_DARWIN_USE_64_BIT_INODE=1' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-DBUILDING_NODE_EXTENSION' -I/Users/seven/Library/Caches/node-gyp/22.1.0/include/node -I/Users/seven/Library/Caches/node-gyp/22.1.0/src -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/openssl/config -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/openssl/openssl/include -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/uv/include -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/zlib -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/v8/include -I/Users/seven/cppjs/include/keyfinder  -O3 -gdwarf-2 -flto -mmacosx-version-min=11.0 -arch x86_64 -Wall -Wendif-labels -W -Wno-unused-parameter -std=gnu++17 -stdlib=libc++ -fno-rtti -fno-exceptions -fno-strict-aliasing -MMD -MF ./Release/.deps/Release/obj.target/addon/audio_reader.o.d.raw   -c
Release/obj.target/addon/audio_reader.o: ../audio_reader.cpp \
  ../audio_reader.h /usr/local/include/sndfile.h
../audio_reader.cpp:
../audio_reader.h:
/usr/local/include/sndfile.h:
