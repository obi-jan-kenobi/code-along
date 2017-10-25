helloWorld :: String -> String
helloWorld name = "Hello " ++ name


saySomething :: String -> String -> String
saySomething x y = x ++ y

sayHello = saySomething "Hello"

sayHello "yaya"
