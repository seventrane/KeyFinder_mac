#include <node.h>
#include <v8.h>
#include <iostream>
#include <string>
#include <vector>
#include <cstdint>
#include <cstring>
#include <sndfile.h> // Include this line
#include "audio_reader.h"
#include "include/keyfinder/keyfinder.h"
#include "include/keyfinder/audiodata.h"
#include "include/keyfinder/constants.h"


void MyFunction(const v8::FunctionCallbackInfo<v8::Value>& args) {
    v8::Isolate* isolate = args.GetIsolate();

    // Read the audio file
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

    // Prepare the AudioData object for KeyFinder
    KeyFinder::AudioData a;
    a.setFrameRate(info.samplerate);
    a.setChannels(info.channels);
    a.addToSampleCount(audioStream.size());

    // Copy audio samples into the AudioData object
    for (size_t i = 0; i < audioStream.size(); i++) {
        a.setSample(i, audioStream[i]);
    }

    // Run the analysis with KeyFinder
    static KeyFinder::KeyFinder k;
    KeyFinder::key_t key = k.keyOfAudio(a);
    
    // Convert the key to a string
    std::string keySignature;
	switch (key) {
	    case KeyFinder::A_MAJOR:
	        keySignature = "A major";
	        break;
	    case KeyFinder::A_MINOR:
	        keySignature = "A minor";
	        break;
	    case KeyFinder::B_FLAT_MAJOR:
	        keySignature = "B♭ major";
	        break;
	    case KeyFinder::B_FLAT_MINOR:
	        keySignature = "B♭ minor";
	        break;
	    case KeyFinder::B_MAJOR:
	        keySignature = "B major";
	        break;
	    case KeyFinder::B_MINOR:
	        keySignature = "B minor";
	        break;
	    case KeyFinder::C_MAJOR:
	        keySignature = "C major";
	        break;
	    case KeyFinder::C_MINOR:
	        keySignature = "C minor";
	        break;
	    case KeyFinder::D_FLAT_MAJOR:
	        keySignature = "D♭ major";
	        break;
	    case KeyFinder::D_FLAT_MINOR:
	        keySignature = "D♭ minor";
	        break;
	    case KeyFinder::D_MAJOR:
	        keySignature = "D major";
	        break;
	    case KeyFinder::D_MINOR:
	        keySignature = "D minor";
	        break;
	    case KeyFinder::E_FLAT_MAJOR:
	        keySignature = "E♭ major";
	        break;
	    case KeyFinder::E_FLAT_MINOR:
	        keySignature = "E♭ minor";
	        break;
	    case KeyFinder::E_MAJOR:
	        keySignature = "E major";
	        break;
	    case KeyFinder::E_MINOR:
	        keySignature = "E minor";
	        break;
	    case KeyFinder::F_MAJOR:
	        keySignature = "F major";
	        break;
	    case KeyFinder::F_MINOR:
	        keySignature = "F minor";
	        break;
	    case KeyFinder::G_FLAT_MAJOR:
	        keySignature = "G♭ major";
	        break;
	    case KeyFinder::G_FLAT_MINOR:
	        keySignature = "G♭ minor";
	        break;
	    case KeyFinder::G_MAJOR:
	        keySignature = "G major";
	        break;
	    case KeyFinder::G_MINOR:
	        keySignature = "G minor";
	        break;
	    default:
	        keySignature = "Unknown";
	        break;
	}
 

    // Create a v8 string from the key signature
    v8::Local<v8::String> result = v8::String::NewFromUtf8(isolate, keySignature.c_str()).ToLocalChecked();

    // Return the key signature string
    args.GetReturnValue().Set(result);
}

void Initialize(v8::Local<v8::Object> exports) {
    NODE_SET_METHOD(exports, "myFunction", MyFunction);
}

NODE_MODULE(addon, Initialize)
