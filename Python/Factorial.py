num = int(input("Enter a number: "))

def factorial(number):
    if number == 0 or number == 1:
        return 1
    else:
        return number * factorial(number - 1)

print("The factorial of the given number", num, "is", factorial(num))
