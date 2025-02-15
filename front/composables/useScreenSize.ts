export const useScreenSize = () => {
  const isMobile = ref(false)

  const checkIfMobile = () => {
    isMobile.value = window.innerWidth <= 1000
  }

  onMounted(() => {
    checkIfMobile()
    window.addEventListener('resize', checkIfMobile)
  })

  onBeforeUnmount(() => {
    window.removeEventListener('resize', checkIfMobile)
  })

  return { isMobile };
}
