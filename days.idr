module days

data days = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

nextday: days -> days
nextday Monday = Tuesday
nextday Tuesday = Wednesday
nextday Wednesday = Thursday
nextday Thursday = Friday
nextday Friday = Saturday
nextday Saturday = Sunday
nextday Sunday = Monday 

nextweekday: days -> days
nextweekday Monday = Tuesday
nextweekday Tuesday = Wednesday
nextweekday Wednesday = Thursday
nextweekday Thursday = Friday
nextweekday Friday = Monday
nextweekday Saturday = Monday
nextweekday Sunday = Monday 



