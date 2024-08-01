from guizero import App, TextBox, Drawing, Combo, Slider

# Functions -------------
def draw_meme():
    meme.clear()
    meme.image(0, 0, "min.png")
    meme.text(
        20, 20, top_text.value,
        color=color.value,
        size=size.value,
        font=font.value
    )
    meme.text(
        20, 320, bottom_text.value,
        color=color.value,
        size=size.value,
        font=font.value
    )

# Create the app
app = App("Meme Generator")

# Add widgets
top_text = TextBox(app, text="top text", command=draw_meme)
bottom_text = TextBox(app, text="bottom text", command=draw_meme)
color = Combo(app,
    options=["black", "white", "red", "green", "blue", "orange"],
    command=draw_meme, selected="blue"
)
font = Combo(app,
    options=["times new roman", "verdana", "courier", "impact"],
    command=draw_meme
)
size = Slider(app, start=20, end=50, command=draw_meme)

meme = Drawing(app, width="fill", height="fill")

# Draw initial meme
draw_meme()

# Display the app
app.display()
