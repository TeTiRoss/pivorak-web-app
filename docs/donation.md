### Donation

Ми використовуємо платіжну кнопку https://wayforpay.com/uk на сторінці https://pivorak.com/donate.

Техпідтримка працює добре, рекомендую.

### Корисні посилання

- [Налаштування магазину тут](https://m.wayforpay.com/uk/mportal/payed-block-configure/notice-update?id=50029)
- [Налаштування webhook та перенравлень після оплати тут](https://m.wayforpay.com/uk/mportal/payments/button-update?id=708524)

### Webhoook / Slack повідомлення

Після оплати ми приймаємо webhook і постимо Slack повідомлення.

Ідеї:
- зробити повідомлення неанонімними
- додати можливість вказати повідомлення яке буде опубліковане в Slack

#### Як працюють перенаправлення після оплати?

ми редіркетимо корисувача на returnUrl, тобто на https://pivorak.com/thank-you-for-donating

### Відомі проблеми

- Apple Pay забороняє показ кнопки оплати в iframe (віджеті), можливий тільки перехід за прямим посиланням.
