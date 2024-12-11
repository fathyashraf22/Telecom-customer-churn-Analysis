select * from telecom
select count ([Customer ID]) from telecom
select count  ( distinct [Customer ID]) from telecom
--- first dealing with nulls -- 
update telecom 
SET [Avg Monthly Long Distance Charges] = coalesce([Avg Monthly Long Distance Charges],0);
update telecom 
SET [Multiple Lines] = coalesce([Multiple Lines],'Not Applcable')
update telecom 
set  [Internet Type] = coalesce([Internet Type],'NO internet')
update telecom 
set [Avg Monthly GB Download] = coalesce ([Avg Monthly GB Download],0)
update telecom 
set [Online Backup] = coalesce ([Online Backup],'Not Applicable')
update telecom 
set [Online Security] = coalesce ([Online Security],'Not Applicable')
update telecom 
set [Device Protection Plan] = coalesce ([Device Protection Plan],'Not Applicable')
update telecom 
set [Premium Tech Support] = coalesce ([Premium Tech Support],'Not Applicable')
update telecom 
set [Streaming TV] = coalesce ([Streaming TV],'Not Applicable')
update telecom 
set [Streaming Movies] = coalesce ([Streaming Movies],'Not Applicable')
update telecom 
set [Streaming Music] = coalesce ([Streaming Music],'Not Applicable')
update telecom 
set [Unlimited Data] = coalesce ([Unlimited Data],'Not Applicable')
update telecom 
set [Churn Category] = coalesce ([Churn Category],'Active Customer')
update Telecom
set [Churn Reason]=coalesce([Churn Reason],'No Churn')
-----------------------------------------------------------
select * from telecom 
where [Customer ID] is null or[Gender] is null or [Age] is null or [Married] is null or [Number of Dependents] is null or [City] is null or [Zip Code] is null or 
[Latitude] is null or [Longitude] is null or [Number of Referrals] is null or [Tenure in Months] is null or [Offer] is null or [Phone Service] is null or 
[Avg Monthly Long Distance Charges] is null or [Multiple Lines] is null or [Internet Service] is null or [Internet Type] is null or [Avg Monthly GB Download] is null or 
[Online Security] is null or [Online Backup] is null or [Device Protection Plan] is null or [Premium Tech Support] is null or [Streaming TV] is null or [Streaming Movies] is null or 
[Streaming Music] is null or [Unlimited Data] is null or [Contract] is null or [Paperless Billing] is null or [Payment Method] is null or [Monthly Charge] is null or 
  [Total Charges] is null or [Total Refunds] is null or [Total Extra Data Charges] is null or [Total Long Distance Charges] is null or [Total Revenue] is null or [Customer Status] is null or 
[Churn Category] is null or [Churn Reason]is null 
--------------------------------------------------------
select * from telecom
--city breakdown--
select count (*) as [total customers] from telecom
select count (*) as [total active customers] from telecom where [Customer Status] = 'stayed'
select count (*) as [total new customers] from telecom where [Customer Status] = 'joined'
select count (*) as [total churned customers] from telecom where [Customer Status] = 'Churned'
select city,count(city) from telecom group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'joined' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'churned' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'stayed' group by City order by count(city) desc
--phone service--
select city,count(city) from telecom where [Customer Status] = 'joined' and [Phone Service]='yes' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'joined' and [Phone Service]='no' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'churned'and [Phone Service]='yes' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'churned'and [Phone Service]='no' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'stayed' and [Phone Service]='yes' group by City order by count(city) desc
select city,count(city) from telecom where [Customer Status] = 'stayed' and [Phone Service]='no' group by City order by count(city) desc
--offers-- & reason
select city , count(City),[Churn Reason] from telecom where Offer='none' and [Customer Status] = 'churned'group by city,[Churn Reason] order by count(City) desc

select * from telecom  t join zipcode z 
on t.[Zip Code] = z.[Zip Code]
select  count(city),Population from zipcode z join telecom t 
on z.[Zip Code] = t.[Zip Code]
where [Customer Status] = 'churned' and city = 'San Diego'
group by Population
select city , [Zip Code] from telecom
 where City = 'San Diego'

 select max([Tenure in Months])from telecom where [Customer Status] = 'stayed'
 select avg([Tenure in Months])from telecom
 select min([Tenure in Months])from telecom

  select *from  telecom where [Customer Status] = 'stayed' and [Tenure in Months] >40



