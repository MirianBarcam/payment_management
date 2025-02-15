import {defineStore} from 'pinia'

export const useLanguageStore = defineStore('language', () => {
  const selectedLanguage = 'en'
  const languages = [
    {
      code: 'es',
      name: 'spanish',
    },
    {
      code: 'en',
      name: 'english',

    }
  ]

  return { languages, selectedLanguage }
})
