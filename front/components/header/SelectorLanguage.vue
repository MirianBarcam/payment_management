<template>
    <div class="selector-language">
        <div class="language" @click="languageClicked('es')"> {{ $t('es') }}  </div>
        <div class="line">/</div>
        <div class="language" @click="languageClicked('en')"> {{ $t('en') }}  </div>
    </div>
</template>
  
<script setup>
    const emit = defineEmits()
    const languageClicked = (language) => {
      emit('language-clicked', language)
    }
  /script>
  
<style scoped>
  .selector-language {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 5px;
  }

  .line {
    cursor: default;
  }

  .language{
    font-size: 14px;
    cursor: pointer;
    color: rgb(195, 192, 192);
  }

  .language:hover {
    color: white;
  }
</style>