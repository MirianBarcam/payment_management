<template>
    <div class="selector-language">
        <div class="language" @click="changeLanguage('es')"> {{ $t('es') }}  </div>
        <div class="line">/</div>
        <div class="language" @click="changeLanguage('en')"> {{ $t('en') }}  </div>
    </div>
</template>
  
<script setup>
  import { useLanguage } from '@/composables/useLanguage'

  const { changeLanguage } = useLanguage()
</script>
  
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
    font-size: 12px;
    cursor: pointer;
    color: rgb(195, 192, 192);
  }

  .language:hover {
    color: white;
  }
</style>