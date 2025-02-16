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
  const { isMobile } = useScreenSize()
</script>
 
