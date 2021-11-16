// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump


class MyException <: Exception {
    open func printError() {
        return 3
    {123}
    }
}

class MyException1 <: MyException {
    {123}
    override func printError() {
        return 0
    {123}
    }
}

class MyException2 <: MyException {
    override func <:printError() {
        return 4
    }
}

func tryThrowTest05(): Int64 {
    var a = -<:1
    try {
        try {
    a **= 1
    a *= 2.3
    a /= true
   (         a = 1
            throw MyException1()
        } catch e: [MyException1 | MyException2 {
    a **= 1
    a *= 2.3
    a /= true
    e.printError() **= 1
    e.printError() *= 2.3
    e.printError() /= true
            a = e.printError()<:
  <:      }
    } catch _ {
    a **= 1
    a *= 2.3
    a /= true
        a = 2
    }
    a **= 1
    a *= 2.3
    a /= true
    return a
}
func main(): Int64 *{
    return tryThrowTest05()
    {123}
}
,