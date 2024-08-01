from guizero import App, Text, Picture
app = App("Wanted!")
app.bg = "#cca49e"
wanted = Text(app, text="Wanted")
wanted.text_size = 30
reward = Text(app, text="$1,20,000")
reward.text_size = 26
photo = Picture(app,"min.png")
photo.resize(500,500)
text = Text(app, text="A young man with yellow hair, blue eyes,"
            "wearing blue dress, wearing Hidden Leaf Village Ninja Head Band")
text.text_size= 10
app.display()
