<!-- Auth.vue - Componente de autenticação -->
<script setup lang="ts">
import { ref } from 'vue';
import { supabase } from '../lib/supabase';

const loading = ref(false);
const email = ref('');
const password = ref('');

const handleLogin = async () => {
  try {
    loading.value = true;
    const { error } = await supabase.auth.signInWithPassword({
      email: email.value,
      password: password.value,
    });

    if (error) throw error;
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message);
    }
  } finally {
    loading.value = false;
  }
};

const handleSignUp = async () => {
  try {
    loading.value = true;
    const { error } = await supabase.auth.signUp({
      email: email.value,
      password: password.value,
    });

    if (error) throw error;
    alert('Cadastro realizado com sucesso!');
  } catch (error) {
    if (error instanceof Error) {
      alert(error.message);
    }
  } finally {
    loading.value = false;
  }
};
</script>

<template>
  <form class="auth-form" @submit.prevent>
    <h2>Login / Cadastro</h2>
    <div class="form-group">
      <label for="email">Email:</label>
      <input
        id="email"
        type="email"
        v-model="email"
        required
        placeholder="seu@email.com"
      />
    </div>
    <div class="form-group">
      <label for="password">Senha:</label>
      <input
        id="password"
        type="password"
        v-model="password"
        required
        placeholder="Sua senha"
      />
    </div>
    <div class="auth-buttons">
      <button
        @click="handleLogin"
        :disabled="loading"
      >
        {{ loading ? 'Carregando...' : 'Entrar' }}
      </button>
      <button
        @click="handleSignUp"
        :disabled="loading"
      >
        {{ loading ? 'Carregando...' : 'Cadastrar' }}
      </button>
    </div>
  </form>
</template>

<style scoped>
.auth-form {
  max-width: 400px;
  margin: 40px auto;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.auth-buttons {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 10px;
  margin-top: 20px;
}

.auth-buttons button {
  width: 100%;
}
</style>