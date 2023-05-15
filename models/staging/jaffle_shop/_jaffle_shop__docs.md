{% docs orders__status %}

Summarizes an order's past or present status.

| `status`         | Description                                                                                    |
|------------------|------------------------------------------------------------------------------------------------|
| `placed`         | The order has been placed but has not yet left the warehouse.                                  |
| `shipped`        | The order has been shipped to the customer and is currently in transit.                        |
| `completed`      | The order has been received by the customer.                                                   |
| `return_pending` | The customer has asked to return the order, but it has not yet been received at the warehouse. |
| `returned`       | The order has been returned by the customer and received at the warehouse.                     |

{% enddocs %}
