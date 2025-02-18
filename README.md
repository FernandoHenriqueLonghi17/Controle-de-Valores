Sistema de Controle Financeiro
Aplicação de controle financeiro pessoal desenvolvida com Vue.js e Supabase para gerenciar entradas e saídas de dinheiro.

Tecnologias Utilizadas
Frontend:

Vue.js (v3) com Composition API.

TypeScript para tipagem estática.

Supabase para autenticação e banco de dados.

Vite para build e desenvolvimento.

Backend:

Supabase (autenticação e banco de dados).

Estilos:

CSS puro com escopo por componente.

Como Rodar a Aplicação
Pré-requisitos
Node.js (v18 ou superior).

Conta no Supabase.

Passos para Executar
Clone o repositório:

bash
Copy
git clone https://github.com/seu-usuario/nome-do-repositorio.git
cd nome-do-repositorio
Instale as dependências:

bash
Copy
npm install
Configure o Supabase:

Crie um projeto no Supabase.

Crie uma tabela costs com a estrutura:

Ative a autenticação por email/senha.

Obtenha as credenciais (URL e chave pública) no painel do Supabase.

Configure as variáveis de ambiente:

Crie um arquivo .env na raiz do projeto:

env
Copy
VITE_SUPABASE_URL=sua-url-do-supabase
VITE_SUPABASE_KEY=sua-chave-publica-do-supabase
Inicie o servidor de desenvolvimento:

bash
Copy
npm run dev
Acesse a aplicação:

Abra o navegador e acesse: http://localhost:5173.

Estrutura do Projeto
Copy
.
├── public/                  # Arquivos estáticos
├── src/
│   ├── assets/              # Recursos estáticos (imagens, estilos)
│   ├── components/          # Componentes Vue
│   ├── lib/                 # Configurações do Supabase
│   ├── types/               # Tipos TypeScript
│   ├── App.vue              # Componente principal
│   └── main.ts              # Ponto de entrada da aplicação
├── .env                     # Variáveis de ambiente
├── package.json             # Dependências e scripts
└── vite.config.ts           # Configuração do Vite
