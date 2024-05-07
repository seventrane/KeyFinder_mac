const express = require('express');
const cors = require('cors');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
const addon = require('./build/Release/addon');

const app = express();

// Allow requests from all origins
app.use(cors());

const storage = multer.diskStorage({
  destination: 'uploads/',
  filename: function (req, file, cb) {
    // Preserve the original file name
    cb(null, file.originalname);
  }
});

const upload = multer({ storage: storage }); // Use custom storage options

// Define a route to handle HTTP POST requests for file uploads
app.post('/api/upload', upload.array('audioFiles'), (req, res) => {
  // Check if files were uploaded
  if (!req.files || req.files.length === 0) {
    return res.status(400).json({ error: 'No files uploaded!' });
  }

  // Extract file paths from the uploaded files
  const filePaths = req.files.map(file => file.path);

  // Call the addon function with each file path
  const results = filePaths.map(filePath => addon.myFunction(filePath));

  // Send the results as JSON response
  res.json({ success: true, results: results });
});

app.post('/api/uploadFile', upload.single('audioFile'), (req, res) => {
  // Check if file was uploaded
  if (!req.file) {
    return res.status(400).json({ error: 'No file uploaded!' });
  }

  // Get the path of the uploaded file
  const filePath = req.file.path;

  // Call addon.myFunction with the file path
  const result = addon.myFunction(filePath);

  // Return the result
  res.json({ success: true, result: result });
});

const bodyParser = require('body-parser'); // Import body-parser middleware


app.use(bodyParser.json()); // Parse JSON request bodies


//app.use(express.static('public')); // Serve static files from the 'public' directory

app.use(express.json());

// Store JSON data in memory
let jsonData = {
    1: { key: "C", quality: "Major", path: "/path/to/song1.mp3", name: "Song 1", artist: "Artist 1" },
    2: { key: "G", quality: "Minor", path: "/path/to/song2.mp3", name: "Song 2", artist: "Artist 2" }
};

// Route to get the JSON data
app.get('/api/get-json', (req, res) => {
    res.json(jsonData);
});

// Route to modify the JSON data
app.post('/api/modify-json', (req, res) => {
    const modifiedJsonData = req.body;
    console.log('Received modified JSON content:', modifiedJsonData);

    // Update the JSON data in memory
    jsonData = modifiedJsonData;

    // Send a success response
    res.status(200).json({ success: true });
});


/*
app.post('/api/modify-html', (req, res) => {
  const modifiedHtml = req.body;
  console.log(typeof(modifiedHtmlS));
  path =  "../Documents/Git-Hub/Ear-Training---Tonic-Finder/public/index.html";
  console.log(path);
  // Write the modified HTML content to the index.html file
  fs.writeFile('"../Documents/Git-Hub/Ear-Training---Tonic-Finder/public/index.html"', modifiedHtml, 'utf8', err => {
    if (err) {
      return res.status(500).json({ error: 'Error writing to index.html' });
    }
    // Send a success response
    res.status(200).json({ success: true });
  });
});
*/
// Define a route to handle HTTP GET requests
app.get('/api/myFunction', (req, res) => {
    // Extract folderPath from request query parameters
    const folderPath = req.query.folderPath;

    // Check if folderPath is provided
    if (!folderPath) {
        return res.status(400).json({ error: 'Folder path is required' });
    }

    // Call the addon function with the folderPath
    const result = addon.myFunction(folderPath);

    // Send the result as JSON response
    res.json({ result: result });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});