<template>
  <div class="container-fluid">
    <div class="row">
      <headerNavbar v-if="!isMobile"/>
      <headerNavbarMobile v-else />
      <!-- <div class="alert alert-danger fixed-top py-1 text-center d-flex align-items-center justify-content-center"
        style="height: 50px;">
        <p class="mb-0 small">{{ $t('app_disclaimer') }}</p>
      </div> -->
      slot
      {{ isMobile }}
      <div class="col-12">
        <slot />
      </div>
      slot
    </div>
  </div>
</template>

<script setup>
  import { useScreenSize } from '@/composables/useScreenSize';

  const { isMobile } = useScreenSize();
</script>

