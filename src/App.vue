<!-- App.vue - Componente principal da aplicação -->
<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { supabase } from './lib/supabase';
import Auth from './components/Auth.vue';
import CostForm from './components/CostForm.vue';
import CostList from './components/CostList.vue';
import type { Cost } from './types/cost';

const session = ref(null);
const costs = ref<Cost[]>([]);
const loading = ref(true);

// Monitora mudanças na autenticação
onMounted(() => {
  supabase.auth.getSession().then(({ data: { session: currentSession } }) => {
    session.value = currentSession;
    if (currentSession) {
      fetchCosts();
    }
  });

  supabase.auth.onAuthStateChange((_event, currentSession) => {
    session.value = currentSession;
  });
});

// Busca as transações do usuário
const fetchCosts = async () => {
  try {
    const { data, error } = await supabase
      .from('costs')
      .select('*')
      .order('data', { ascending: false });

    if (error) throw error;
    costs.value = data;
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message);
    }
  } finally {
    loading.value = false;
  }
};

// Adiciona nova transação
const handleCostAdded = async (newCost: Omit<Cost, 'id'>) => {
  try {
    const { error } = await supabase.from('costs').insert([
      {
        ...newCost,
        user_id: session.value?.user.id
      }
    ]);

    if (error) throw error;
    fetchCosts();
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message);
    }
  }
};

// Calcula o total de entradas
const totalEntradas = () => {
  return costs.value
    .filter(cost => cost.tipo === 'entrada')
    .reduce((sum, cost) => sum + cost.valor, 0);
};

// Calcula o total de saídas
const totalSaidas = () => {
  return costs.value
    .filter(cost => cost.tipo === 'saida')
    .reduce((sum, cost) => sum + cost.valor, 0);
};

// Calcula o saldo atual
const saldo = () => totalEntradas() - totalSaidas();

// Função para fazer logout
const handleLogout = async () => {
  try {
    const { error } = await supabase.auth.signOut();
    if (error) throw error;
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message);
    }
  }
};
</script>

<template>
  <div class="container">
    <template v-if="!session">
      <Auth />
    </template>
    <template v-else>
      <div class="header">
        <h1>Sistema de Controle Financeiro</h1>
        <button @click="handleLogout" class="logout-button">Sair</button>
      </div>
      
      <!-- Resumo financeiro -->
      <div class="summary">
        <div class="summary-item entrada">
          <h3>Total de Entradas</h3>
          <p>R$ {{ totalEntradas().toFixed(2) }}</p>
        </div>
        <div class="summary-item saida">
          <h3>Total de Saídas</h3>
          <p>R$ {{ totalSaidas().toFixed(2) }}</p>
        </div>
        <div class="summary-item saldo" :class="{ negative: saldo() < 0 }">
          <h3>Saldo</h3>
          <p>R$ {{ saldo().toFixed(2) }}</p>
        </div>
      </div>

      <!-- Formulário e lista de transações -->
      <CostForm @cost-added="handleCostAdded" />
      <CostList :costs="costs" />
    </template>
  </div>
</template>

<style>
@import './assets/styles/main.css';

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.logout-button {
  padding: 8px 16px;
  background-color: #ff7675;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.logout-button:hover {
  background-color: #e66767;
}
</style>