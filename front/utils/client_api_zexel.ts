import { PaymentModel } from "~/public/js/zexel-models" 

export async function getAllPaymentsService() {
    const response = await fetch('http://localhost:8000/api/payments/', {
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    })
    const data = await response.json()
    return data.map((item:any) => new PaymentModel(item))
}

export async function getPaymentService(id: number) {
    const response = await fetch(`http://localhost:8000/api/payments/${id}/`, {
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    });

    if (response.ok) {
        const data = await response.json()
        return new PaymentModel(data)
    }
}

export async function addPaymentService(payment: PaymentModel): Promise<boolean> {
    try {
        const response = await fetch(`http://localhost:8000/api/payments/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payment) 
        });

        return response.ok
    } catch (error) {
        console.error('Error adding payment:', error)
        return false
    }
}

export async function editPaymentService(id: number, payment: PaymentModel): Promise<boolean> {
    try {
        const response = await fetch(`http://localhost:8000/api/payments/${id}/`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(payment) 
        });

        return response.ok
    } catch (error) {
        console.error('Error editing payment:', error)
        return false;
    }
}

export async function removePaymentService(id: number): Promise<boolean> {
    try {
        const response = await fetch(`http://localhost:8000/api/payments/${id}/`, {
            method: 'DELETE'
        });
        return response.ok;
    } catch (error) {
        console.error('Error removing payment:', error);
        return false;
    }
}
