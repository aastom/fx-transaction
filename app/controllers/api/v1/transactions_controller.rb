module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        transactions = Transaction.order('transaction_date DESC')
        render json: ResponseHandler.new({
                                           code: 2000,
                                           success: true,
                                           data: transactions
                                         }).response, status: :ok
      end

      def show
        transaction = Transaction.find_by_transaction_id(params[:id])
        render json: ResponseHandler.new({
                                           code: 2001,
                                           success: true,
                                           data: transaction
                                         }).response, status: :ok
      end

      def create
        transaction = Transaction.new(post_params)
        begin
          transaction.output_amount = calculate_output_amount(post_params[:input_amount])
          if transaction.save
            puts transaction.to_json
            render json: ResponseHandler.new({
                                               code: 2002,
                                               success: true,
                                               data: transaction.reload
                                             }).response, status: :created
          else
            render json: ResponseHandler.new({
                                               code: 3000,
                                               success: false,
                                               data: transaction.errors.full_messages
                                             }).response, status: :unprocessable_entity
          end
        rescue StandardError => e
          render json: ResponseHandler.new({
                                             code: 3000,
                                             success: false,
                                             data: e.message
                                           }).response, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_currency)
      end

      def calculate_output_amount(input_amount)
        input_amount * 2.3
      end
    end
  end
end
