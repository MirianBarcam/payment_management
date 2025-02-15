<template>
    <nav :class="mobileMenuActive? 'navbar-open' : 'navbar'">
        <div class="content">
  
            <NuxtLink to="/payments" class="logo">
            Zexel Pay  
            </NuxtLink>
    
            <div>
                <HeaderHamburguerBtn @hamburguer-clicked="hamburguerclicked"/>
            </div>
   
        </div>

        <div v-if="mobileMenuActive" class="sub-content">

            <div v-for="(option, index) in menu" :key="index" class="link">
                <NuxtLink :to="option.link" class="text-link">
                    {{ $t(option.name) }}
                </NuxtLink>
            </div> 
            <div class="selector-language">
                <HeaderSelectorLanguage/>
            </div>

        </div> 

    </nav>
</template>
  
<script setup>
    import { useNavbarStore } from '@/store/useNavbarStore';
  
    const navbarStore = useNavbarStore()
    const menu = navbarStore.menu
    const mobileMenuActive= ref(false)
  
    const hamburguerclicked = ()=> {
      mobileMenuActive.value = !mobileMenuActive.value
    }
</script>
  
<style scoped>  
    .navbar {
        position: fixed;
        display: flex;
        background-color: #333;
        padding: 0px 20px;
        height: 40px;
    }

    .navbar-open {
        position: fixed;
        display: flex;
        flex-direction: column;
        background-color: #333;
        padding: 0px 20px;
        height: 130px;
    }

    .content {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height: 40px;
    }

    .sub-content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        margin-top: 10px;
        width: 100%;
    }
    
    .logo {
        color: white;
        font-size: 16px;
        text-decoration: none;
    }
        
    .link {
        text-decoration: none;
        display: flex;
        justify-content: center;
    }
    
    .text-link {
        display: flex;
        font-size: 12px;
        color: rgb(195, 192, 192);
        text-decoration: none;
        align-items: center;
    }
    
    .text-link:hover{
        color: white;
    }

    .selector-language {
        display: flex;
        justify-content: center;
        width: 100%;
        margin-top: 10px;
    }
</style>