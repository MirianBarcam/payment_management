import {defineStore} from 'pinia'

export const useNavbarStore = defineStore('navbar', () => {
  const menu = [
        { name: 'payments', link: '/payments' },
        { name: 'add_payments', link: '/payments/add' },
        { name: 'countries', link: '/countries' },
        { name: 'search_countries', link: '/countries/search' }
  ]
  
  return { menu }
})
