# Sistema de Controle Financeiro

Um aplicativo web para controle financeiro pessoal desenvolvido com Vue 3, TypeScript e Vite. O sistema permite registrar entradas e saídas financeiras, visualizar o saldo atual e acompanhar o histórico de transações.

## 🚀 Funcionalidades

- Registro de transações (entradas e saídas)
- Cálculo automático de saldo
- Visualização do total de entradas e saídas
- Histórico completo de transações
- Armazenamento local dos dados
- Interface responsiva e amigável

## 🛠️ Tecnologias Utilizadas

- Vue 3 - Framework JavaScript progressivo
- TypeScript - Superset tipado do JavaScript
- Vite - Build tool e dev server
- LocalStorage - Para persistência local dos dados
- CSS Modular - Para estilização dos componentes

## 📋 Pré-requisitos

- Node.js (versão 14 ou superior)
- npm (geralmente vem com Node.js)

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone [url-do-repositorio]
```

2. Acesse a pasta do projeto:
```bash
cd sistema-controle-financeiro
```

3. Instale as dependências:
```bash
npm install
```

4. Inicie o servidor de desenvolvimento:
```bash
npm run dev
```

## 🖥️ Estrutura do Projeto

```
src/
├── assets/         # Arquivos estáticos e estilos CSS
├── components/     # Componentes Vue reutilizáveis
├── lib/           # Funções utilitárias e serviços
├── types/         # Definições de tipos TypeScript
└── App.vue        # Componente raiz da aplicação
```

### Componentes Principais

- `App.vue` - Componente principal que gerencia o estado da aplicação
- `CostForm.vue` - Formulário para adicionar novas transações
- `CostList.vue` - Lista de transações com detalhes

### Estilos

Os estilos estão organizados em arquivos CSS separados:
- `main.css` - Estilos globais
- `form.css` - Estilos específicos para formulários
- `list.css` - Estilos para a lista de transações

## 📦 Build para Produção

Para gerar a versão de produção:

```bash
npm run build
```

Os arquivos otimizados serão gerados na pasta `dist/`.

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Faça commit das suas alterações (`git commit -m 'Add some AmazingFeature'`)
4. Faça push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para detalhes.

## ✨ Próximos Passos

- [ ] Adicionar categorias para transações
- [ ] Implementar filtros por data
- [ ] Adicionar gráficos de análise
- [ ] Exportação de relatórios
- [ ] Temas claro/escuro
