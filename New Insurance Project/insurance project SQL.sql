#1-No of Invoice by Accnt Exec
select	* from invoice;
select account_executive, count(invoice_number) as no_of_invoice from invoice
group by account_executive 
order by no_of_invoice desc;

#2-Yearly Meeting Count
select substr( meeting_date,7)  as Yearly_meetings ,count(meeting_date) as Total_meetings from meeting
     group by  Yearly_meetings;

#Q3 Total  Opportunity by revenue 
 select  count(revenue_amount)  as total_opportunity
 from opportunity;
 
#Q4 Total open Opportunity 
select  count(stage) as open_opportunity 
from opportunity
where stage = 'Qualify Opportunity' or 'Propose Solution'
group by stage;

#Q5 top 4 opportunities by revenue 
select opportunity_name, sum(revenue_amount) as top_4_opportunities 
from opportunity
group by opportunity_name
order by top_4_opportunities desc
limit 4;

# Q6 Number of meetings by account executive 
 select `Account Executive` , count(meeting_date)  
 from meeting
 group by `Account Executive`
 union all
 select 'total' as `Account Executive` ,
 count(meeting_date) from meeting;
 
#Q7 Opportunity by product distribution
select   product_group ,count('opportunity_name') from opportunity
  group by product_group
  union all
 select  'total' as product_group ,
 count('opportunity_name')  from opportunity;
 
 #stage by revenue 
 select stage,sum(revenue_amount) as stage_by_revenue from opportunity
 group by stage;
 
 #Target , achieved, invoice for New 
 #target new 
 select concat(format(sum(Cross_sell_bugdet)/1000000,0)," ", "M") as crosssell_target
 from individual_budgets;
 
 #achieved
 select concat(format(sum(b.Amount)+sum(f.amount),0)/1," ","M") as achieved
from brokerage b join fees f on b.Account_Exe_ID = f.Account_Exe_ID
where b.income_class = "new" and f.income_class = "new" ;

 #For invoice New 
 select concat(format(sum(invoice_number)/1000000000,1)," ","M") as invoice_new 
from invoice
 where income_class = "New";

# Target , achieved, invoice for cross_sell 

#target Cross sell
select concat(format(sum(Cross_sell_bugdet)/1000000,0)," ", "M") as crosssell_target
 from individual_budgets; 
 
 #achieved cross sell
 select concat(format(sum(b.Amount)+sum(f.amount),0)/1," ","M") as achieved
from brokerage b join fees f on b.Account_Exe_ID = f.Account_Exe_ID
where b.income_class = "cross sell" and f.income_class = "cross sell" ;
 
#For invoice cross sell
select concat(format(sum(invoice_number),0)/10," ","M" )as invoice_new  from invoice
where income_class = "Cross Sell" ;

#Target , achieved, invoice for renewal target 
  
#target  
  select concat(format(sum(Renewal_Budget),0)/1," ","M") as Target_renemal from individual_budgets;
 
# achieved
select concat(format(sum(b.Amount)+sum(f.amount),0)/1," ","M") as achieved
from brokerage b join fees f on b.Account_Exe_ID = f.Account_Exe_ID
where b.income_class = "renewal" and f.income_class = "renewal" ;

#For invoice renewal
  select concat(format(sum(invoice_number),0)/10," ","M") as invoice_number from invoice
  where income_class = "renewal" ;
  