<template>
    <div v-if="alert.active" class="alert" :class="alert.type"  role="alert">
        <div class="wrapper-alert">
            <div class="message-alert text-zexel-subtitle">
            {{ alert.message }}
            </div>
            <button @click="closeAlert" type="button" class="btn-close" aria-label="Close">
                <img src="/images/icon_close.png" class="close-icon"/>
            </button>
        </div>
    </div>
</template>

<script setup>
  import { useAlert } from '@/composables/useAlert'

  const { alert, closeAlert, showAlert } = useAlert()
</script>

<style scoped>
  .alert {
    z-index: 10;
    position: fixed;
    display: flex;
    justify-content: center;
    width: 100%;
    height: 40px;
  }

  .wrapper-alert {
    display: flex;
    flex: 1;
    justify-content: space-between;
    align-items: center;
    max-width: 1290px;
  }

  .message-alert {
    color: white;
  }

  .btn-close {
    display: flex;
    width: fit-content;
  }

  .close-icon {
    width: 14px;
  }

  .error {
    background-color: var(--zexel-error);
  }

  .info {
    background-color: var(--zexel-info);
  }
  
  .success {
    background-color: var(--zexel-success);
  }
</style>