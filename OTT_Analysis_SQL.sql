CREATE TABLE netflix_users (
    user_id           NUMBER PRIMARY KEY,
    subscription_type VARCHAR2(50),
    monthly_revenue   NUMBER(10, 2),
    join_date         DATE,
    last_payment_date DATE,
    country           VARCHAR2(50),
    age               NUMBER,
    gender            VARCHAR2(10),
    device            VARCHAR2(50),
    plan_duration     VARCHAR2(20)
);


-- imported the data from the Netflix_userbase.csv file

SELECT
    *
FROM
    netflix_users
ORDER BY
    user_id;

-- Identifying the user now active or inactive ?

SELECT
    n.*,
    CASE
        WHEN sysdate - last_payment_date > 30 THEN
            'Yes'
        ELSE
            'No'
    END AS churn_flag
FROM
    netflix_users n;
    
-- Identifying the Age group of the Users

SELECT
    n.*,
    CASE
        WHEN age < 18 THEN
            '<18'
        WHEN age >= 18
             AND age < 26 THEN
            '18-25'
        WHEN age > 25
             AND age < 36 THEN
            '26-35'
        WHEN age > 35
             AND age < 46 THEN
            '36-45'
        WHEN age > 45
             AND age < 61 THEN
            '46-60'
        ELSE
            '>60'
    END AS age_group
FROM
    netflix_users n;
    
-- Calculate Tenure in Months from the Join_date to till_now

SELECT
    n.*,
    round(months_between(sysdate, join_date)) AS tenure_months
FROM
    netflix_users n;

-- calculating the number of churned vs Active users

SELECT
    churn_flag,
    COUNT(*)
FROM
    (
        SELECT
            n.*,
            CASE
                WHEN sysdate - last_payment_date < 30 THEN
                    'Yes'
                ELSE
                    'No'
            END AS churn_flag
        FROM
            netflix_users n
    )
GROUP BY
    churn_flag;

-- Revenue by country 

SELECT
    country,
    SUM(monthly_revenue) AS total_revenue
FROM
    netflix_users
GROUP BY
    country
ORDER BY
    total_revenue DESC;

-- Device used by Active users 

SELECT
    device,
    COUNT(*) AS churned_users
FROM
    (
        SELECT
            device,
            CASE
                WHEN sysdate - last_payment_date > 30 THEN
                    'Yes'
                ELSE
                    'No'
            END AS churn_flag
        FROM
            netflix_users
    )
WHERE
    churn_flag = 'Yes'
GROUP BY
    device;

-- Average revenue by the each Age groups

SELECT
    CASE
        WHEN age < 18 THEN
            '<18'
        WHEN age >= 18
             AND age < 26 THEN
            '18-25'
        WHEN age > 25
             AND age < 36 THEN
            '26-35'
        WHEN age > 35
             AND age < 46 THEN
            '36-45'
        WHEN age > 45
             AND age < 61 THEN
            '46-60'
        ELSE
            '>60'
    END AS age_group,
    round(
        avg(monthly_revenue),
        2
    )   AS avg_revenue
FROM
    netflix_users
GROUP BY
    CASE
        WHEN age < 18 THEN
            '<18'
        WHEN age >= 18
             AND age < 26 THEN
            '18-25'
        WHEN age > 25
             AND age < 36 THEN
            '26-35'
        WHEN age > 35
             AND age < 46 THEN
            '36-45'
        WHEN age > 45
             AND age < 61 THEN
            '46-60'
        ELSE
            '>60'
    END
ORDER BY
    AVG(monthly_revenue) DESC;
    
--Number of users based on the Subscription Type 

SELECT subscription_type, COUNT(*) AS total_users
FROM netflix_users
GROUP BY subscription_type;

