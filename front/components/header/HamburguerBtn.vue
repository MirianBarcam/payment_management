<template>
  <div class="hamburger" @click="hamburguerClicked()">
    <img src="/images/icon_hamburguer.png" alt="hamburguer_icon"/>
  </div>   
</template>
  
<script setup>
  const emit = defineEmits()

  const hamburguerClicked = () => {
    emit('hamburguer-clicked')
  }
</script>
  
<style scoped>
  .hamburguer {
    display: flex;
    flex: column;
  }

  img {
    width: 18px;
  }
  </style>