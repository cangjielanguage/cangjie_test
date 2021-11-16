// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var a = b(c : true, d : "")
let e : String = "hello"

func main(){}

class b {
  init(c ! : Bool, d ! : String) {
        print("${e}") // EXPECTED: regex 'e' is used before initialization
  }
}
