import {defineStore} from 'pinia'
import { PaymentModel } from "~/public/js/zexel-models" 

export const usePaymentsStore = defineStore('payments', () => {
   const payments: PaymentModel[] = [];

  return { payments }
})