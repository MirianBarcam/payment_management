import {defineStore} from 'pinia'

export const useAlertStore = defineStore('alert', () => {
  const alert = ref(
    {
        active: false,
        type: 'success',
        message: ''
    }
  )

  return { alert }
})