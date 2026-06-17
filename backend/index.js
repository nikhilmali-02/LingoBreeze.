const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const words = [
  { word: 'Apple', meaning: 'A fruit', translation: 'Manzana' },
  { word: 'Beautiful', meaning: 'Pleasing to look at', translation: 'Hermosa' },
  { word: 'Water', meaning: 'A clear liquid', translation: 'Agua' },
];

app.get('/words', (req, res) => {
  res.json(words);
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});