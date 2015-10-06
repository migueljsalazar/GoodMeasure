def currency(num)
   '%#.2f' % (num)
end

puts "How much is the bill?"
bill_amount = gets.chomp.to_f

puts "What percentage would you like to tip? (15%, 18%, 20%)"
tip_percent = gets.chomp.to_i

def change (tip_percent)
  if tip_percent == 0
    tip_percent = 0
  elsif 10 > tip_percent
    tip_percent = tip_percent.to_f
    tip_percent = tip_percent / 100
  else
tip_percent = tip_percent.to_s
tip_percent= tip_percent.split(//).first(2).join.to_s
tip_percent= tip_percent.to_f
tip_percent = tip_percent / 100
end
end

tip_percent = change(tip_percent)

puts "How many people are at your table?"
split_by = gets.chomp.to_i
tip = bill_amount * tip_percent
total = bill_amount + tip.round(2)

my_share = (total / split_by)
my_share = currency(my_share)
bill_amount = currency(bill_amount)
tip = currency(tip)
total = currency(total)

puts " " "
The bill with tip comes out to $#{total}
Your share of the bill is $#{my_share}
" " "

puts " " "

--------------------------------------------------
                E11EVEN MIAMI
                29 NE 11TH ST
               MIAMI, FL 33130
   
  DATE: 9/29/15            
  TIME: 6:54 AM
  SERVER: ED \"THE BULL\" TORO

  
  BILL AMOUNT                      $#{bill_amount}

  LAP DANCE                        $0.00 -COMP
  PRIVATE SHOW                     $0.00 -COMP









                      SUB TOTAL:   $#{bill_amount}
                            TIP:   $#{tip}
                          TOTAL:   $#{total}


                      AMOUNT ON 
                      YOUR CARD:   $#{my_share}





                  THANK YOU
            NICE SEEING YOU AGAIN!
               (305) 829-2911

--------------------------------------------------



" " "
