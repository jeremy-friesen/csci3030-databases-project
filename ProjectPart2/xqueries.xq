xquery version "3.0";
BARS/BAR/BEER

(:
Bud
			2.50
Miller
			3.00
:)

xquery version "3.0";
for $beer in BARS/BAR/BEER
where $beer/PRICE  > 2.5
order by $beer/PRICE
return $beer

(:
		Miller
			3.00
:)

xquery version "3.0";
for $actor in MOVIES/MOVIE/CAST/ACTOR
where $actor/AGE < 35
order by $actor/AGE
return $actor

(:
	Mark Hamill
  	 26
   	 Desert Planet
      	1.98
        	  	

      	Zazie Beetz
      	34
      	Washington DC
      	1.9
:)

xquery version "3.0";
for $mov in MOVIES/MOVIE
where  $mov/YEAR <= 2018 and $mov/YEAR >= 2016
order by $mov/NAME
return $mov

(:
Joker
    	
  		
      			Jauquin Phoenix
      			45
      			New York
      			1.83
          	
      		
      			Zazie Beetz
      			34
      			Washington DC
      			1.9
            	
     	
    	2018
      	Todd Philips
      	5000000
      	8.9
      	1.31
:)