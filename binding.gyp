{
  "targets": [
    {
      "target_name": "addon",
      "sources": [ "addon.cpp", "audio_reader.cpp" ],
      "include_dirs": [
          "/Users/seven/cppjs/include/keyfinder/"
      ],
      "libraries": ["-lsndfile", "-L/Users/seven/cppjs/lib/", "-lkeyfinder"],    
      "cflags": [ "-std=c++11", "-frtti" ],
      "cflags!": [ "-f-exceptions" ],
      "cflags_cc!": [ "-f-exceptions" ],
      "ExceptionHandling": 1,
            
          "defines": ["BUILDING_NODE_EXTENSION"]
        }
    
  ]  
}