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

1.  ### POST /transactions: create a new transaction

    #### Request body:

    ```json
    {
      "customer_id": "string",
      "input_amount": "float",
      "input_currency": "string",
      "output_currency": "string"
    }
    ```

    > Example request body:

    ```json
    {
      "customer_id": "23e-567d-11e",
      "input_amount": 23.45,
      "input_currency": "EUR",
      "output_currency": "USD"
    }
    ```

    #### Response body:

    ```json
    {
      "transaction_id": "string",
      "transaction_date": "datetime",
      "customer_id": "string",
      "input_amount": "float",
      "input_currency": "string",
      "output_amount": "float",
      "output_currency": "string"
    }
    ```

    > Example response body:

    ```json
    {
      "transaction_id": "transaction_id",
      "transaction_date": "2020-01-01T00:00:00.000Z",
      "customer_id": "23e-567d-11e",
      "input_amount": 23.45,
      "input_currency": "EUR",
      "output_amount": 25.55,
      "output_currency": "USD"
    }
    ```

2.  ### GET /transactions: list all transactions in the system

    #### Response body:

    ```json
    [
      {
        "transaction_id": "string",
        "transaction_date": "datetime",
        "customer_id": "string",
        "input_amount": "float",
        "input_currency": "string",
        "output_amount": "float",
        "output_currency": "string"
      }
    ]
    ```

    > Example response:

    ```json
    [
      {
        "transaction_id": "transaction_id",
        "transaction_date": "2020-01-01T00:00:00.000Z",
        "customer_id": "23e-567d-11e",
        "input_amount": 23.45,
        "input_currency": "EUR",
        "output_amount": 25.55,
        "output_currency": "USD"
      }
    ]
    ```

3.  ### GET /transactions/<transaction_id>: get the specific transaction by ID

    #### Response body:

    ```json
    {
      "transaction_id": "string",
      "transaction_date": "datetime",
      "customer_id": "string",
      "input_amount": "float",
      "input_currency": "string",
      "output_amount": "float",
      "output_currency": "string"
    }
    ```

    > Example response:

    ```json
    {
      "transaction_id": "transaction_id",
      "transaction_date": "2020-01-01T00:00:00.000Z",
      "customer_id": "23e-567d-11e",
      "input_amount": 23.45,
      "input_currency": "EUR",
      "output_amount": 25.55,
      "output_currency": "USD"
    }
    ```
