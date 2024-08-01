import turtle

# Set up the screen
turtle.bgcolor('black')
wn = turtle.Screen()
wn.title("Welcome Pattern")

# Create a turtle object
tr = turtle.Turtle()
tr.speed("fastest")

# Initialize the movement variable
move = 1

# Drawing loop
for i in range(360):
    tr.penup()
    tr.goto(-200, 100)
    tr.pendown()
    tr.write("Welcome", align='center', font=('Showcard Gothic', 50, 'normal'))
    tr.color("orange")
    tr.right(move)
    tr.forward(100)
    tr.penup()
    tr.color("white")
    tr.pendown()
    tr.right(30)
    tr.forward(60)
    tr.color("light green")
    tr.left(10)
    tr.forward(50)
    tr.right(70)
    tr.color('light blue')
    tr.forward(50)
    tr.color('light green')
    tr.circle(2)
    tr.color('light blue')
    tr.circle(4)
    tr.penup()
    tr.forward(20)
    tr.pendown()
    tr.circle(6)
    tr.penup()
    tr.forward(40)
    tr.pendown()
    tr.circle(8)
    tr.penup()
    tr.forward(80)
    tr.pendown()
    tr.circle(10)
    tr.penup()
    tr.forward(120)
    tr.pendown()
    tr.circle(20)
    tr.color('yellow')
    tr.circle(10)
    tr.penup()
    tr.forward(150)
    tr.pendown()
    tr.color('red')
    tr.forward(50)
    tr.color('blue')
    tr.penup()
    tr.home()
    tr.pendown()
    move += 1

# Finish the drawing
turtle.done()
