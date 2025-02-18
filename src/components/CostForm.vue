<!-- CostForm.vue - Componente do formulário de entrada de dados -->
<script setup lang="ts">
import { ref } from 'vue';
import type { NewCost } from '../types/cost';

// Define os eventos que o componente pode emitir
const emit = defineEmits<{
  (e: 'costAdded', cost: NewCost): void;
}>();

// Estado inicial do formulário
const cost = ref<NewCost>({
  descricao: '',
  valor: 0,
  tipo: 'entrada',
  data: new Date().toISOString().split('T')[0]
});

// Função para lidar com o envio do formulário
const handleSubmit = () => {
  emit('costAdded', { ...cost.value });
  // Reseta o formulário após o envio
  cost.value = {
    descricao: '',
    valor: 0,
    tipo: 'entrada',
    data: new Date().toISOString().split('T')[0]
  };
};
</script>

<template>
  <form @submit.prevent="handleSubmit" class="cost-form">
    <!-- Campo de descrição -->
    <div class="form-group">
      <label for="descricao">Descrição:</label>
      <input
        id="descricao"
        v-model="cost.descricao"
        type="text"
        required
        placeholder="Digite a descrição"
      />
    </div>

    <!-- Campo de valor -->
    <div class="form-group">
      <label for="valor">Valor:</label>
      <input
        id="valor"
        v-model="cost.valor"
        type="number"
        step="0.01"
        required
        placeholder="Digite o valor"
      />
    </div>

    <!-- Seleção do tipo de transação -->
    <div class="form-group">
      <label for="tipo">Tipo:</label>
      <select id="tipo" v-model="cost.tipo">
        <option value="entrada">Entrada</option>
        <option value="saida">Saída</option>
      </select>
    </div>

    <!-- Campo de data -->
    <div class="form-group">
      <label for="data">Data:</label>
      <input
        id="data"
        v-model="cost.data"
        type="date"
        required
      />
    </div>

    <button type="submit">Adicionar</button>
  </form>
</template>

<style scoped>
@import '../assets/styles/form.css';
</style>