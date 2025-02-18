/*
  # Criação da tabela de custos

  1. Nova Tabela
    - `costs`
      - `id` (uuid, chave primária)
      - `descricao` (texto, não nulo)
      - `valor` (decimal, não nulo)
      - `tipo` (texto, não nulo, apenas 'entrada' ou 'saida')
      - `data` (data, não nulo)
      - `user_id` (uuid, não nulo, referência à tabela auth.users)
      - `created_at` (timestamp com timezone, padrão now())

  2. Segurança
    - Habilita RLS na tabela costs
    - Adiciona política para usuários autenticados lerem apenas seus próprios registros
    - Adiciona política para usuários autenticados criarem registros
    - Adiciona política para usuários autenticados atualizarem seus próprios registros
    - Adiciona política para usuários autenticados excluírem seus próprios registros
*/

-- Criação da tabela de custos
CREATE TABLE costs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    descricao text NOT NULL,
    valor decimal(10,2) NOT NULL,
    tipo text NOT NULL CHECK (tipo IN ('entrada', 'saida')),
    data date NOT NULL,
    user_id uuid NOT NULL REFERENCES auth.users(id),
    created_at timestamptz DEFAULT now()
);

-- Habilita Row Level Security
ALTER TABLE costs ENABLE ROW LEVEL SECURITY;

-- Políticas de segurança
CREATE POLICY "Usuários podem ver seus próprios registros"
    ON costs
    FOR SELECT
    TO authenticated
    USING (auth.uid() = user_id);

CREATE POLICY "Usuários podem criar registros"
    ON costs
    FOR INSERT
    TO authenticated
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem atualizar seus próprios registros"
    ON costs
    FOR UPDATE
    TO authenticated
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Usuários podem excluir seus próprios registros"
    ON costs
    FOR DELETE
    TO authenticated
    USING (auth.uid() = user_id);