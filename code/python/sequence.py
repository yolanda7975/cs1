def hs(n):
    cnt=0
    while (n != 1):
        print(n) 
        cnt = cnt + 1
        if(n%2 ==0):
            n = n //2
        else:
            n = 3 *n +1
    print (n)
    print (cnt)
 
