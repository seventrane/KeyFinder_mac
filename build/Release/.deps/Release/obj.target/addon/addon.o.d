cmd_Release/obj.target/addon/addon.o := c++ -o Release/obj.target/addon/addon.o ../addon.cpp '-DNODE_GYP_MODULE_NAME=addon' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-D_GLIBCXX_USE_CXX11_ABI=1' '-D_DARWIN_USE_64_BIT_INODE=1' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-DBUILDING_NODE_EXTENSION' -I/Users/seven/Library/Caches/node-gyp/22.1.0/include/node -I/Users/seven/Library/Caches/node-gyp/22.1.0/src -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/openssl/config -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/openssl/openssl/include -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/uv/include -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/zlib -I/Users/seven/Library/Caches/node-gyp/22.1.0/deps/v8/include -I/Users/seven/cppjs/include/keyfinder  -O3 -gdwarf-2 -flto -mmacosx-version-min=11.0 -arch x86_64 -Wall -Wendif-labels -W -Wno-unused-parameter -std=gnu++17 -stdlib=libc++ -fno-rtti -fno-exceptions -fno-strict-aliasing -MMD -MF ./Release/.deps/Release/obj.target/addon/addon.o.d.raw   -c
Release/obj.target/addon/addon.o: ../addon.cpp \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/cppgc/common.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8config.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-array-buffer.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-local-handle.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-handle-base.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-internal.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-object.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-maybe.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-persistent-handle.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-weak-callback-info.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-primitive.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-data.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-value.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-traced-handle.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-container.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-context.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-snapshot.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-isolate.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-callbacks.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-promise.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-debug.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-script.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-memory-span.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-message.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-embedder-heap.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-function-callback.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-microtask.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-statistics.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-unwinder.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-embedder-state-scope.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-date.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-exception.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-extension.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-external.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-function.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-template.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-initialization.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-platform.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-source-location.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-json.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-locker.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-microtask-queue.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-primitive-object.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-proxy.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-regexp.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-typed-array.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-value-serializer.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-version.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-wasm.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_version.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_api.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/js_native_api.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/js_native_api_types.h \
  /Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_api_types.h \
  /usr/local/include/sndfile.h ../audio_reader.h \
  ../include/keyfinder/keyfinder.h \
  /Users/seven/cppjs/include/keyfinder/audiodata.h \
  /Users/seven/cppjs/include/keyfinder/constants.h \
  /Users/seven/cppjs/include/keyfinder/exception.h \
  /Users/seven/cppjs/include/keyfinder/lowpassfilterfactory.h \
  /Users/seven/cppjs/include/keyfinder/lowpassfilter.h \
  /Users/seven/cppjs/include/keyfinder/workspace.h \
  /Users/seven/cppjs/include/keyfinder/binode.h \
  /Users/seven/cppjs/include/keyfinder/chromagram.h \
  /Users/seven/cppjs/include/keyfinder/fftadapter.h \
  /Users/seven/cppjs/include/keyfinder/chromatransformfactory.h \
  /Users/seven/cppjs/include/keyfinder/chromatransform.h \
  /Users/seven/cppjs/include/keyfinder/spectrumanalyser.h \
  /Users/seven/cppjs/include/keyfinder/temporalwindowfactory.h \
  /Users/seven/cppjs/include/keyfinder/windowfunctions.h \
  /Users/seven/cppjs/include/keyfinder/keyclassifier.h \
  /Users/seven/cppjs/include/keyfinder/toneprofiles.h \
  ../include/keyfinder/audiodata.h ../include/keyfinder/constants.h
../addon.cpp:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/cppgc/common.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8config.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-array-buffer.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-local-handle.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-handle-base.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-internal.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-object.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-maybe.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-persistent-handle.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-weak-callback-info.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-primitive.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-data.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-value.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-traced-handle.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-container.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-context.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-snapshot.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-isolate.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-callbacks.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-promise.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-debug.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-script.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-memory-span.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-message.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-embedder-heap.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-function-callback.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-microtask.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-statistics.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-unwinder.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-embedder-state-scope.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-date.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-exception.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-extension.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-external.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-function.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-template.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-initialization.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-platform.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-source-location.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-json.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-locker.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-microtask-queue.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-primitive-object.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-proxy.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-regexp.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-typed-array.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-value-serializer.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-version.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/v8-wasm.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_version.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_api.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/js_native_api.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/js_native_api_types.h:
/Users/seven/Library/Caches/node-gyp/22.1.0/include/node/node_api_types.h:
/usr/local/include/sndfile.h:
../audio_reader.h:
../include/keyfinder/keyfinder.h:
/Users/seven/cppjs/include/keyfinder/audiodata.h:
/Users/seven/cppjs/include/keyfinder/constants.h:
/Users/seven/cppjs/include/keyfinder/exception.h:
/Users/seven/cppjs/include/keyfinder/lowpassfilterfactory.h:
/Users/seven/cppjs/include/keyfinder/lowpassfilter.h:
/Users/seven/cppjs/include/keyfinder/workspace.h:
/Users/seven/cppjs/include/keyfinder/binode.h:
/Users/seven/cppjs/include/keyfinder/chromagram.h:
/Users/seven/cppjs/include/keyfinder/fftadapter.h:
/Users/seven/cppjs/include/keyfinder/chromatransformfactory.h:
/Users/seven/cppjs/include/keyfinder/chromatransform.h:
/Users/seven/cppjs/include/keyfinder/spectrumanalyser.h:
/Users/seven/cppjs/include/keyfinder/temporalwindowfactory.h:
/Users/seven/cppjs/include/keyfinder/windowfunctions.h:
/Users/seven/cppjs/include/keyfinder/keyclassifier.h:
/Users/seven/cppjs/include/keyfinder/toneprofiles.h:
../include/keyfinder/audiodata.h:
../include/keyfinder/constants.h:
