# fx-transaction

[![FX Transactions CI Tests](https://github.com/aastom/fx-transaction/actions/workflows/ci-tests.yml/badge.svg)](https://github.com/aastom/fx-transaction/actions/workflows/ci-tests.yml)

FX-Transaction stores how much money received from the customer in the input currency, and how much is paid to the customer in the output currency.

## All transactions need the following details:

1. An identifier
2. A customer ID showing who created the transaction
3. Input amount and currency
4. Output amount and currency
5. Date of transaction

## The following three endpoints are available:

1. ### POST /transactions: create a new transaction

   ```json
        //Request
        {
            "customer_id" : string,// e.g "customer_id": "23e-567d-11e"
            "input_amount" : float,// e.g "input_amount": 23.45
            "input_currency": string,// e.g "input_currency": "EUR"
            "output_currency" :string // e.g "output_currency": "USD"
        }

        //Response
        {
            "transaction_id" : string, // e.g "transaction_id": "8998-ef8979-13e-788"
            "transaction_date" : datetime, // e.g "transaction_date": "2020-01-01T00:00:00.000Z"
            "customer_id" : string, // e.g "customer_id": "23e-567d-11e"
            "input_amount" : float, // e.g "input_amount": 23.45
            "input_currency": string, // e.g "input_currency": "EUR"
            "output_amount" : float, //  e.g "output_amount": 25.55
            "output_currency": string // e.g "output_currency": "USD"
        }
   ```

2. ### GET /transactions: list all transactions in the system
   ```json
        //Response
        [
            {
                "transaction_id" : string, // e.g "transaction_id": "8998-ef8979-13e-788"
                "transaction_date" : datetime, // e.g "transaction_date": "2020-01-01T00:00:00.000Z"
                "customer_id" : string, // e.g "customer_id": "23e-567d-11e"
                "input_amount" : float, // e.g "input_amount": 23.45
                "input_currency": string, // e.g "input_currency": "EUR"
                "output_amount" : float, //  e.g "output_amount": 25.55
                "output_currency": string // e.g "output_currency": "USD"
            }
        ]
   ```
3. ### GET /transactions/<transaction_id>: get the specific transaction by ID
   ```json
       //Response
       {
            "transaction_id" : string, // e.g "transaction_id": "8998-ef8979-13e-788"
            "transaction_date" : datetime, // e.g "transaction_date": "2020-01-01T00:00:00.000Z"
            "customer_id" : string, // e.g "customer_id": "23e-567d-11e"
            "input_amount" : float, // e.g "input_amount": 23.45
            "input_currency": string, // e.g "input_currency": "EUR"
            "output_amount" : float, //  e.g "output_amount": 25.55
            "output_currency": string // e.g "output_currency": "USD"
        }
   ```
