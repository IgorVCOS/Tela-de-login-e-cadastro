//NPM INSTALL
//NPM INIT
//NPM INSTALL MYSQL
//NPM INSTALL EXPRESS





const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 4000;

// Configuração do body-parser para lidar com os dados do formulário
app.use(bodyParser.urlencoded({ extended: true }));

// Configuração do EJS como view engine
app.set('view engine', 'ejs');
app.set('views', __dirname + '/views');

// Configuração do banco de dados
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'pessoa'
});

// Conexão com o banco de dados
connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }
  console.log('Conexão ao banco de dados estabelecida');
});

// vai aparecer o login
app.get('/', (req, res) => {
  res.render('login');
});

app.get('/cadastro', (req, res) => {
  res.render('cadastro');
});

app.post('/cadastrar', (req, res) => {
  const {
    nome,
    senha,
    idade,
    uf,
    cidade,
    cep,
    cpf,
    rg,
    estado_civil,
    ano_nascimento
  } = req.body;

  const query = 'INSERT INTO cadastro (nome, senha, idade, uf, cidade, cep, cpf, rg, estado_civil, ano_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  connection.query(
    query,
    [
      nome,
      senha,
      idade,
      uf,
      cidade,
      cep,
      cpf,
      rg,
      estado_civil,
      ano_nascimento
    ],
    (err, results) => {
      if (err) {
        console.error('Erro ao cadastrar usuário:', err);
        res.send('Erro ao cadastrar usuário');
      } else {
        res.send('<script>alert("Usuário cadastrado com sucesso!"); window.location="/";</script>');
      }
    }
  );
});

// vai processar o login
app.post('/login', (req, res) => {
  const { nome, senha } = req.body;

  const query = 'SELECT * FROM cadastro WHERE nome = ? AND senha = ?';
  connection.query(query, [nome, senha], (err, results) => {
    if (err) throw err;

    if (results.length > 0) {
      res.render('dashboard', { user: results[0] }); // vai carregar a pagina do dashboard
    } else {
      res.send('<script>alert("Credenciais inválidas!"); window.location="/";</script>');
    }
  });
});

app.get('/dashboard', (req, res) => {
  res.send('Acesso não autorizado'); 
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});

app.get('/logout', (req, res) => {
  res.redirect('/'); // vai para a pagina de login
});

app.post('/excluir', (req, res) => {
  const userId = req.body.userId; // pega o ID que vai ser excluido

  const query = 'DELETE FROM cadastro WHERE id = ?'; // Query para excluir usuario pelo ID
  connection.query(query, [userId], (err, result) => {
    if (err) {
      console.error('Erro ao excluir usuário:', err);
      res.send('Erro ao excluir usuário');
    } else {
      res.send('<script>alert("Usuário excluído com sucesso!"); window.location="/";</script>');
    }
  });
});