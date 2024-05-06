const express = require('express');
const cors = require('cors'); // Import cors package
const addon = require('./build/Release/addon');

const app = express();

// Enable CORS for all routes
app.use(cors());

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
