#include <node.h>
#include <v8.h>
#include <iostream>
#include <string>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <sndfile.h> // Include this line
#include "audio_reader.h"
#include "include/keyfinder/keyfinder.h"
#include "include/keyfinder/audiodata.h"
#include "include/keyfinder/constants.h"

void MyFunction(const v8::FunctionCallbackInfo<v8::Value>& args) {
    v8::Isolate* isolate = args.GetIsolate();

	SF_INFO info;
	    SNDFILE* file = sf_open("fnl.wav", SFM_READ, &info);
	    if (!file) {
	        std::cerr << "Error opening file: " << sf_strerror(nullptr) << std::endl;
	        return;
	    }

	    // Prepare a buffer to read audio samples
	    std::vector<float> audioStream(info.frames * info.channels);
	    sf_readf_float(file, audioStream.data(), info.frames);

	    // Close the file
	    sf_close(file);

	    // Create a v8 integer representing the size of the audio stream
	    v8::Local<v8::Integer> result = v8::Integer::New(isolate, audioStream.size());

	    // Return the result
	    args.GetReturnValue().Set(result);
}

void Initialize(v8::Local<v8::Object> exports) {
    NODE_SET_METHOD(exports, "myFunction", MyFunction);
}

NODE_MODULE(addon, Initialize)
