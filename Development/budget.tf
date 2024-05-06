resource "aws_budgets_budget" "budget-limit" {
  name              = "budget-limit"
  budget_type       = "COST"
  limit_amount      = "1"
  limit_unit        = "USD"
  time_period_end   = "2050-06-15_00:00"
  time_period_start = "2024-04-03_00:00"
  time_unit         = "DAILY"


  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 40
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["anup.jacob@outlook.com"]
  }
}
