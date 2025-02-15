import { useLanguageStore } from "~/store/useLanguageStore"

export const useLanguage = () => {
  const {locale} = useI18n()
  const languageStore = useLanguageStore()

  const changeLanguage = (language:string) => {
    languageStore.selectedLanguage = language
    locale.value = language
  }
  
  return { changeLanguage }
}