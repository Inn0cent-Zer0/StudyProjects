import time
import datetime as dt
import turtle

# Create a turtle to display time
t = turtle.Turtle()

# Create a turtle to create the rectangle box
t1 = turtle.Turtle()

# Create screen
s = turtle.Screen()

# Set background color of the screen
s.bgcolor("green")

# Obtain current hour, minute, and second from the system
sec = dt.datetime.now().second
min = dt.datetime.now().minute
hr = dt.datetime.now().hour

# Setup the rectangle box
t1.pensize(3)
t1.color('black')
t1.penup()

# Set the position of turtle
t1.goto(-100, 0)  # Adjusted to center the rectangle better
t1.pendown()

# Create rectangular box
for i in range(2):
    t1.forward(200)
    t1.left(90)
    t1.forward(70)
    t1.left(90)

# Hide the turtle
t1.hideturtle()

while True:
    t.hideturtle()
    t.clear()
    # Display the time
    t.penup()
    t.goto(-85, 15)  # Adjusted to center the text in the rectangle
    t.pendown()
    t.write(str(hr).zfill(2) + ":" + str(min).zfill(2) + ":" + str(sec).zfill(2),
            font=("Arial Narrow", 35, "bold"))
    time.sleep(1)
    sec += 1

    if sec == 60:
        sec = 0
        min += 1

    if min == 60:
        min = 0
        hr += 1

    if hr == 24:  # Use 24-hour format to avoid confusion with AM/PM
        hr = 0
