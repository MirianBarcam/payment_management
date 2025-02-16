<template>
  <div class="container-fluid">
    <div class="row">
      <headerNavbar v-if="!isMobile"/>
      <headerNavbarMobile v-else />
      <Alert></Alert>
      <div class="col-12">
        <slot />
      </div>
    </div>
  </div>
</template>

<script setup>
  import { useScreenSize } from '@/composables/useScreenSize'

  const { isMobile } = useScreenSize()

  import { useAlert } from '@/composables/useAlert'
</script>
 
