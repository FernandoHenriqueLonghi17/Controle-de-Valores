export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      costs: {
        Row: {
          id: string
          descricao: string
          valor: number
          tipo: 'entrada' | 'saida'
          data: string
          user_id: string
          created_at: string
        }
        Insert: {
          id?: string
          descricao: string
          valor: number
          tipo: 'entrada' | 'saida'
          data: string
          user_id: string
          created_at?: string
        }
        Update: {
          id?: string
          descricao?: string
          valor?: number
          tipo?: 'entrada' | 'saida'
          data?: string
          user_id?: string
          created_at?: string
        }
      }
    }
  }
}