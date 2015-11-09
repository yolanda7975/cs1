module light
data color = red | amber | green

light: color -> color
light red = green
light amber = red
light green = amber
