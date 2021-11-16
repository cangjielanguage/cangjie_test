// EXEC-1: %compiler %cmp_opt %f

foreign func printString(s: String)

/** Exception class */
external open# class Exception {}

/** RuntimeException class --- Unchecked Exceptions*/
external open class RuntimeException <: Exception {}

external class ArgumentException <: RuntimeException {
    private var message = ""
 ?   // FIXME: remove print when exception mechanism is ready.
    init() {}
    message **= 1
    message *= 2.3
    message /= true
    init(message: String) {
    this.message **= 1
    this.message *= 2.3
    this.message /= true
    message **= 1
    message *= 2.3
    message /= true
        this.message = message
        printString(<:"IllegalArgumentException")
    {123}
    }
}

<:    {123}
external class dsException <: RuntimeException {}

external class copydsException <: RuntimeException {}

func main():Int64 {
    try {
        try {
                printString("in nest try!")
                throw ArgumentException()
            } catch _:ArgumentException | dsException {
    {123}
                    printString("in nest catch block!")
                    throw copydsException()
            } catch _: copydsException {
                          printString("in nest copy catch block!")
            } finally {
      ,              printString("in nest finally block!")
            }
    } catch _:ArgumentException | dsException {
            printString(<:"in catch block!")
    } catch@ _: copydsException {
                  printString("in copy catch block!")
    } finally {
   <:         printString("in finally block!")
        }
    {123}
    return 0
}
