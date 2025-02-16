import { usePaymentsStore } from "~/store/usePaymentsStore"
import { useAlert } from '@/composables/useAlert'
import type { PaymentModel } from "~/public/js/zexel-models"

export const usePayments = () => {
    const { payments } = usePaymentsStore()
    const { showAlert } = useAlert()

    const getPayments = async () => {
        try {
            const newPayments : PaymentModel[] = await getAllPaymentsService()
            payments.splice(0, payments.length, ...newPayments)
        } catch (e) {
            showAlert('error', e.message )
        }
    }

    const addPayment = async (payment:PaymentModel) => {
        try {
            addPaymentService(payment)
        } catch (e) {
            showAlert('error', e.message )
        }
    }

    const editPayment = async (id:number, payment:PaymentModel) => {
        try {
            editPaymentService(id, payment.id)
        } catch (e) {
            showAlert('error', e.message )
        }
    }

    const removePayment = async (id:number) => {
        try {
            
        } catch (e) {
            showAlert('error', e.message )
        }
    }

  return { payments, getPayments, editPayment, removePayment, addPayment }
}