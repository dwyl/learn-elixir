defmodule Alpha do
  def descending do
    str =  """
      account_type_code: string;
      account_type_label_en: string;
      account_type_label_ar?: string;
      account_status_code: string;
      account_status_label_en: string;
      account_status_label_ar?: string;
      account_name?: string;
      account_number: string;
      account_opening_date?: string;
      account_bucket_code: BucketType;
      account_id: string;
      base_currency_code: string;
      available_balance_value?: string;
      total_balance_value?: string;
      hold_balance_value?: string;
      profit_rate?: string;
      fixed_deposit_profit_accrued_value?: string;
      fixed_deposit_principal_value?: string;
      credit_card_last_4_digits?: string;
      maturity_date?: string;
      fixed_deposit_auto_renewal_status_code?: string;
      credit_limit_value?: string;
      credit_card_last_statement_balance?: string;
      credit_card_minimum_payment_due_value?: string;
      credit_card_minimum_payment_due_date?: string;
      financing_limit_value?: string;
      purchasing_power?: string;
    """
  list = String.split(str, "\n")
    |> Enum.map(fn x -> String.trim(x) end)
    |> Enum.filter(& &1 != []) # remove empty items
    |> Enum.sort()
    |> Enum.map(fn x -> IO.inspect(x) end)
  end
end

Alpha.descending()

# execute this file by running:
# elixir examples/lists/alphabetise.ex
