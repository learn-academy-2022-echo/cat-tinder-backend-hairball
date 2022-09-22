cats = [
    {
        name: "Duchess",
        age: 2,
        enjoys: "eating cold things",
        image: "https://cdn.pixabay.com/photo/2022/02/17/04/54/animal-7017938__340.jpg"
    },
    {
        name: "Freya",
        age: 6,
        enjoys: "sitting in shoeboxes",
        image: "https://images.unsplash.com/photo-1585137173132-cf49e10ad27d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc2lhbiUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80"
    },
    {
        name: "Yuna",
        age: 1,
        enjoys: "playing dead",
        image: "https://thumbs.dreamstime.com/b/portrait-funny-cat-fly-his-nose-portrait-funny-cat-fly-his-nose-isolated-white-background-125606127.jpg"
    },
    {
        name: "Akita",
        age: 7,
        enjoys: "sitting on the bed",
        image: "https://i.ytimg.com/vi/317jz-PU7Mg/maxresdefault.jpg"
    },
]

cats.each do |cat|
    Cat.create cat
    p "Creating cat #{cat}"
end