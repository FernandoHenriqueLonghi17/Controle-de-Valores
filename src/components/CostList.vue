<!-- CostList.vue - Componente para exibição da lista de transações -->
<script setup lang="ts">
import type { Cost } from '../types/cost';

// Define as propriedades que o componente recebe
defineProps<{
  costs: Cost[];
}>();
</script>

<template>
  <div class="cost-list">
    <h2>Transações</h2>
    <div class="list-container">
      <!-- Mensagem quando não há transações -->
      <div v-if="costs.length === 0" class="no-costs">
        Nenhuma transação registrada
      </div>
      <!-- Lista de transações -->
      <div v-else class="costs">
        <div v-for="cost in costs" :key="cost.id" class="cost-item" :class="cost.tipo">
          <div class="cost-info">
            <h3>{{ cost.descricao }}</h3>
            <span class="date">{{ new Date(cost.data).toLocaleDateString('pt-BR') }}</span>
          </div>
          <div class="amount">
            {{ cost.tipo === 'entrada' ? '+' : '-' }}R$ {{ Math.abs(cost.valor).toFixed(2) }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import '../assets/styles/list.css';
</style>