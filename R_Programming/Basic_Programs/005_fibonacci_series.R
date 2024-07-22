# R program to get the first 10 Fibonacci numbers.

f1=0
f2=1
i=1
print("_-_-_-_-_-_-_-_-_-Fibonacci Series-_-_-_-_-_-_-_-_-_")
print(f1)
print(f2)
while(i<=8)
{
  
 f3=f1+f2
 print(f3)
 f1=f2
 f2=f3
 i=i+1
}
