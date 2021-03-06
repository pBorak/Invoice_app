class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :destroy]
  before_action :authenticate_user!
  before_action :check_ownership, only: [:show,  :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = current_user.invoices.build
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = current_user.invoices.build(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

  def check_ownership
    invoice = current_user.invoices.find_by(id: params[:id])
    redirect_to root_url if invoice.nil?
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:amount, :company, :contragent, :currency, :date)
    end
end
