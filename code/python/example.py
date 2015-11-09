# assignment commands

# {}
x=5

#{(x,5)}
y=6

#{(x,5),(x,6)}

#conditions

if (True):
    x = 0
    z = 10
else:
    x = 1
    z = 11
#{(x,0),(y,6),(z,10)}

if (x>0 or y==x):   #x > 0   or  y=x; v=or
    x = 0
    z = 10
else:
    x = 1
    z = 11

# iteration
times = 10
while (times > 0):
    print ("hello")
    times = (times - 1)

#procedure and procedure call
def fun(a,b,c,x):
    result = a *(x*x) + b*x +c
    return result
