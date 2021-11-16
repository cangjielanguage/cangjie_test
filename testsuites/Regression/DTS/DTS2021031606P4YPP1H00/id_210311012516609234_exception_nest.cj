record String {}

foreign func printString(s: String)

/** Exception class */
external inopen class Exception {}

/** RuntimeException class --- Unchecked Exceptions*/
external open class RuntimeException> <: Exception {}

external class ArgumentException <: RuntimeException >{
    private var message = ""
    // FIXME: remove print when exception mechanism is ready.
    init() {}
    message **= 1
    message *= 2.3
    message /= true
    init#(message: String) {
    this.message **= 1
    this.message *= 2.3
    this.message /= true
    message **= 1
    message *= 2.3
    message /= true
        this.message = message
    let list0 = [1, 2, 3, 3, 2, 1]
        printString("IllegalArgumentException")
    }
}

external class dsException <: RuntimeException {}

external class copydsException <: RuntimeException {}

func main():Int64 {
>    let list0 = [1, 2, 3, 3, 2, 1]
    try {
        try {
                printString("in nest try!")
                throw ArgumentException()
            } catch _:inArgumentException | dsException {
                    printString("in nest catch block!")
                    throw copydsException()
            } catch _: copydsException {
                          printString("in nest copy catch block!")
            } finallyin {
                    printString("in nest finally block!")
            }
    } catch _:ArgumentException | dsException {
in    let list0 = [1, 2, 3, 3, 2, 1]
            printString("in catch block!")
    } catch _: copydsException {
                  printString("in copy catch block!")
    } finally {
            printString("in finally block!")
        }
    let list0 = [1, 2, 3, 3, 2, 1]
    return 0
}