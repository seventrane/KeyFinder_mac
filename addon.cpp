#include <node.h>
#include <v8.h>
#include <iostream>
#include <string>
#include <vector>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <sndfile.h> // Include this line
#include <dirent.h> // Include this for directory operations    
#include "audio_reader.h"
#include "include/keyfinder/keyfinder.h"
#include "include/keyfinder/audiodata.h"
#include "include/keyfinder/constants.h"

#include <cstdio> // Include for std::rename


namespace fs = std::filesystem;

void deleteFile(const std::string& filePath) {
    // Check if the file exists
    if (!fs::exists(filePath)) {
        std::cerr << "Error: File does not exist" << std::endl;
        return;
    }

    // Delete the file
    fs::remove(filePath);

    std::cout << "File deleted successfully" << std::endl;
}

void copyFile(const std::string& sourcePath, const std::string& destinationPath) {
    // Check if the source file exists
    if (!fs::exists(sourcePath)) {
        std::cerr << "Error: Source file does not exist" << std::endl;
        return;
    }

    // Create the destination directory if it doesn't exist
    std::string destinationDir = destinationPath.substr(0, destinationPath.find_last_of('/'));
    if (!fs::exists(destinationDir)) {
        if (!fs::create_directories(destinationDir)) {
            std::cerr << "Error: Failed to create destination directory" << std::endl;
            return;
        }
    }

    // Copy the file to the destination
    fs::copy_file(sourcePath, destinationPath, fs::copy_options::overwrite_existing);
    std::cout << "File copied successfully" << std::endl;

}



bool fileExists(const std::string& filePath) {
    return fs::exists(filePath);
}

std::string getKeySignature(SNDFILE* file, const SF_INFO& info, const std::string& pathReal) {
    std::cout << "Starting key signature detection..." << std::endl;

    if (!fileExists(pathReal)) {
        std::cerr << "Error: Source file does not exist" << std::endl;
        // You can return an empty string or some other value to indicate an error
        return "";
    }

    std::string sourcePath = pathReal;
    std::string destinationPath = pathReal;
    size_t pos = destinationPath.find("./uploads");
    if (pos != std::string::npos) {
        destinationPath.replace(pos, strlen("./uploads"), "pianoSongs");
    }

   // std::cout << "Source Path: " << sourcePath << std::endl;
   // std::cout << "Destination Path: " << destinationPath << std::endl;

    
	/* NOT COPYING THE FILE ANYMORE DOING THINGS SEPARATE SO ONCE THE KEY IS RETURNED TEH FILE IS DELTED 
	// Copy the file to the destination
    std::cout << "Copying file..." << std::endl;
    
	copyFile(sourcePath, destinationPath);
    std::cout << "File copied successfully." << std::endl;
	*/
    
	// Prepare audio stream and close the file
    std::vector<float> audioStream(info.frames * info.channels);
    sf_readf_float(file, audioStream.data(), info.frames);
    sf_close(file);

    // Prepare the AudioData object for KeyFinder
    KeyFinder::AudioData a;
    a.setFrameRate(info.samplerate);
    a.setChannels(info.channels);
    a.addToSampleCount(audioStream.size());

    // Copy audio samples into the AudioData object
    std::cout << "Preparing audio data..." << std::endl;
    for (size_t i = 0; i < audioStream.size(); i++) {
        a.setSample(i, audioStream[i]);
    }
    std::cout << "Audio data prepared successfully." << std::endl;

    // Run the analysis with KeyFinder
    std::cout << "Running key signature detection..." << std::endl;
    static KeyFinder::KeyFinder k;
    KeyFinder::key_t key = k.keyOfAudio(a);
    std::cout << "Key signature detected." << std::endl;

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

    std::cout << "Key signature: " << keySignature << std::endl;

	deleteFile(sourcePath);	
	std::cout << "File deleted successfully." << std::endl;
    return keySignature;
	
}

std::pair<SNDFILE*, SF_INFO> MySecondFunction(const char* filename) {
    if (strstr(filename, "/.")) {
        std::cerr << "Skipping hidden file: " << filename << std::endl;
        return {nullptr, SF_INFO()};
    }

    SF_INFO info;
    SNDFILE* file = sf_open(filename, SFM_READ, &info);
    if (!file) {
        std::cerr << "Error opening file: " << sf_strerror(nullptr) << std::endl;
        return {nullptr, SF_INFO()};
    }
    return {file, info};
}

std::vector<std::string> getFilePaths(const std::string& folderPath) {
    std::vector<std::string> filePaths;
    DIR* dir;
    struct dirent* entry;

    // Open the directory
    if ((dir = opendir(folderPath.c_str())) != NULL) {
        // Iterate through each entry in the directory
        while ((entry = readdir(dir)) != NULL) {
            std::string filename = entry->d_name;
            // Exclude directories and special files
            if (filename != "." && filename != "..") {
                std::string filePath = folderPath + "/" + filename;
                filePaths.push_back(filePath);
            }
        }
        closedir(dir);
    } else {
        std::cout << "DIR: " << folderPath.c_str();
        std::cerr << "Error opening directory: " << folderPath << std::endl;
    }
    return filePaths;
}

void MyFunction(const v8::FunctionCallbackInfo<v8::Value>& args) {
    v8::Isolate* isolate = args.GetIsolate();

    if (args.Length() < 1) {
        isolate->ThrowException(
            v8::Exception::TypeError(v8::String::NewFromUtf8(isolate, "Wrong number of arguments").ToLocalChecked()));
        return;
    }

    if (!args[0]->IsString()) {
        isolate->ThrowException(
            v8::Exception::TypeError(v8::String::NewFromUtf8(isolate, "First argument must be a string").ToLocalChecked()));
        return;
    }

    v8::Local<v8::String> folderPathArg;
    if (!args[0]->ToString(isolate->GetCurrentContext()).ToLocal(&folderPathArg)) {
        isolate->ThrowException(
            v8::Exception::TypeError(v8::String::NewFromUtf8(isolate, "Failed to convert argument to string").ToLocalChecked()));
        return;
    }

    v8::String::Utf8Value folderPath(isolate, folderPathArg);
    std::string folderPathStr(*folderPath);

    std::cout << "Folder: " << folderPathStr;
    std::vector<std::string> filePaths = getFilePaths(folderPathStr);

    // Create a JavaScript array to hold the file paths and key signatures
    v8::Local<v8::Array> resultArray = v8::Array::New(isolate, filePaths.size());
    for (size_t i = 0; i < filePaths.size(); i++) {
        // Print progress with file name
        std::cout << "Processing file " << (i + 1) << " of " << filePaths.size() << ": " << filePaths[i] << std::endl;

        // Call MySecondFunction for each file path
        auto [file, info] = MySecondFunction(filePaths[i].c_str());
        if (!file) {
            // Handle the case when MySecondFunction fails to open the file
            continue; // Skip to the next file
        }

        std::string keySignature = getKeySignature(file, info, filePaths[i]);

        // Create a v8 string from the key signature
        v8::Local<v8::String> keySignatureString = v8::String::NewFromUtf8(isolate, keySignature.c_str()).ToLocalChecked();
        v8::Local<v8::Array> fileInfo = v8::Array::New(isolate, 2);
        v8::Maybe<bool> setFilePathResult = fileInfo->Set(isolate->GetCurrentContext(), 0, v8::String::NewFromUtf8(isolate, filePaths[i].c_str()).ToLocalChecked());
        if (setFilePathResult.IsNothing()) {
            // Handle error if setting file path failed
        }

        v8::Maybe<bool> setKeySignatureResult = fileInfo->Set(isolate->GetCurrentContext(), 1, keySignatureString);
        if (setKeySignatureResult.IsNothing()) {
            // Handle error if setting key signature failed
        }

        v8::Maybe<bool> setResult = resultArray->Set(isolate->GetCurrentContext(), i, fileInfo);
        if (setResult.IsNothing()) {
            // Handle error if setting fileInfo in resultArray failed
        }
    }

    // Return the array of file paths
    args.GetReturnValue().Set(resultArray);
}

void Initialize(v8::Local<v8::Object> exports) {
    NODE_SET_METHOD(exports, "myFunction", MyFunction);
}

NODE_MODULE(addon, Initialize)
