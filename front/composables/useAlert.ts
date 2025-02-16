import { useAlertStore } from "~/store/useAlertStore"

export const useAlert = () => {
  const { alert } = useAlertStore()

  const showAlert = (type:string, message:string) => {
    const typeIsValid = _handleValidType(type)

    if (typeIsValid) {
      alert.active = true
      alert.type = type
      alert.message = message
    } else {
      console.log('error type alert')
    } 
  }

  const _handleValidType = (type:string) => {
    const validTypes = ['success', 'error', 'info']
    return validTypes.includes(type)
  }

  const closeAlert = () => {
    alert.active = false
  }
  
  return { alert, showAlert, closeAlert }
}