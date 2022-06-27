# frozen_string_literal: true

module Api
  module V1
    # TransactionsController contains the endpoints for processing transaction requests.
    class TransactionsController < ApplicationController
      def index
        transactions = Transaction.order('transaction_date DESC')
        render json: ResponseHandler.new({
                                           code: 2000,
                                           success: true,
                                           data: Transaction.cleanall(transactions)
                                         }).response, status: :ok
      end

      def show
        transaction = Transaction.find_by_transaction_id(params[:id])
        unless transaction.present?
          return render json: ResponseHandler.new({
                                                    code: 3001,
                                                    success: false,
                                                    data: transaction
                                                  }).response, status: :not_found
        end

        render json: ResponseHandler.new({
                                           code: 2001,
                                           success: true,
                                           data: Transaction.clean(transaction)
                                         }).response, status: :ok
      end

      def update
        # input_currency
        # input_amount
        # output_currency
        if post_params[:transaction_id].present?
          puts "post_params: #{post_params.to_json}"
          transaction = Transaction.find_by_transaction_id(post_params[:transaction_id])
          puts "transaction: #{transaction}"
        end
        if transaction.nil?
          return render json: ResponseHandler.new({
                                                    code: 3001,
                                                    success: false,
                                                    data: transaction
                                                  }).response, status: :not_found
        end

        begin
          transaction.update!(post_params)

          render json: ResponseHandler.new({
                                             code: 2003,
                                             success: true,
                                             data: Transaction.clean(transaction)
                                           }).response, status: :accepted
        rescue ActiveRecord::RecordInvalid => e
          render json: ResponseHandler.new({
                                             code: 3002,
                                             success: false,
                                             data: e.message
                                           }).response, status: :bad_request
        end
      end

      def create
        transaction = Transaction.new(post_params)
        begin
          if post_params[:input_amount].present?
            transaction.output_amount = Transaction.calculate_output_amount(post_params[:input_amount])
          end
          if transaction.save
            render json: ResponseHandler.new({
                                               code: 2002,
                                               success: true,
                                               data: Transaction.clean(transaction.reload)
                                             }).response, status: :created
          else
            render json: ResponseHandler.new({
                                               code: 3000,
                                               success: false,
                                               data: transaction.errors.full_messages
                                             }).response, status: :unprocessable_entity
          end
        rescue StandardError => e
          puts e
          render json: ResponseHandler.new({
                                             code: 3000,
                                             success: false,
                                             data: e.message
                                           }).response, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_currency,
                                            :transaction_id)
      end
    end
  end
end
