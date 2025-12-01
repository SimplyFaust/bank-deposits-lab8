SELECT 
    client_id AS "Номер клиента",
    first_name || ' ' || last_name AS "ФИО клиента"
FROM bank.client;

SELECT deposit_id, balance FROM bank.deposit 
ORDER BY balance DESC;

SELECT * FROM bank.deposit 
WHERE balance > 30000 AND currency_id = 1; 

SELECT * FROM bank.client 
WHERE last_name LIKE 'И%' OR last_name LIKE 'П%';

SELECT * FROM bank.deposit 
WHERE NOT interest_rate = 0.08; 

SELECT deposit_id, client_id FROM bank.deposit 
WHERE end_date IS NULL; 

SELECT * FROM bank."transaction" 
WHERE transaction_type IN ('deposit', 'interest');

SELECT deposit_id, initial_amount FROM bank.deposit 
WHERE initial_amount BETWEEN 10000 AND 50000;

SELECT first_name, last_name, phone FROM bank.client 
WHERE phone LIKE '+7916%'; 

SELECT DISTINCT currency_id FROM bank.deposit; 

SELECT deposit_id, balance FROM bank.deposit 
ORDER BY balance DESC 
LIMIT 5; 

SELECT 
    c.first_name || ' ' || c.last_name AS клиент,
    d.deposit_id AS "№ вклада",
    dt.name AS "Тип вклада",
    cur.name AS валюта,
    d.balance AS остаток,
    br.name AS филиал
FROM bank.deposit d
JOIN bank.client c ON d.client_id = c.client_id
JOIN bank.deposit_type dt ON d.deposit_type_id = dt.deposit_type_id
JOIN bank.currency cur ON d.currency_id = cur.currency_id
JOIN bank.branch br ON d.branch_id = br.branch_id
WHERE d.balance > 20000
ORDER BY d.balance DESC
LIMIT 10;
