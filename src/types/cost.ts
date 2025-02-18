// Definição dos tipos de dados utilizados na aplicação

// Interface que define a estrutura de uma transação
export interface Cost {
  id: number;          // Identificador único da transação
  descricao: string;   // Descrição da transação
  valor: number;       // Valor da transação
  tipo: 'entrada' | 'saida';  // Tipo da transação (entrada ou saída)
  data: string;        // Data da transação
}

// Tipo para nova transação (omite o ID pois será gerado automaticamente)
export type NewCost = Omit<Cost, 'id'>;