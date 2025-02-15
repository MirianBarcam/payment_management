<template>
  <nav class="navbar">
    <div class="content">
    
      <NuxtLink to="/payments" class="logo">
        Zexel Pay  
      </NuxtLink>

      <div class="container-links">
        <div v-for="(option, index) in menu" :key="index" class="link">
         <NuxtLink :to="option.link" class="text-link">
            {{ $t(option.name) }}
          </NuxtLink>
        </div> 
      </div>

      <div class="navbar-container-settings">
        <HeaderSelectorLanguage></HeaderSelectorLanguage>
      </div>
 
    </div>
  </nav>
</template>

<script setup>
  import { useNavbarStore } from '@/store/useNavbarStore'

  const navbarStore = useNavbarStore()
  const menu = navbarStore.menu
  const mobileMenuActive= ref(false)
</script>

<style scoped>
  .navbar {
    position: fixed;
    display: flex;
    justify-content: center;
    background-color: #333;
    padding: 0px 20px;
    height: 40px;
  }

  .logo {
    color: white;
    font-size: 20px;
    text-decoration: none;
  }

  .content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 1300px;
  }

  .navbar-container-settings {
    display: flex;
    justify-content: center;
    max-width: 200px;
    font-size: 12px;
    color: white;
  }
 
  .container-links {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    width: 100%;
    max-width: 600px;
  }

  .link {
    text-decoration: none;
    display: flex;
    justify-content: center;
  }

  .text-link {
    font-size: 12px;
    color: rgb(195, 192, 192);
    text-decoration: none;
  }

  .text-link:hover{
    color: white;
  }
</style>