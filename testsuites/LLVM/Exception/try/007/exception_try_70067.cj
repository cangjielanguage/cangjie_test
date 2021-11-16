// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan None

class A <: Exception{}

func test():Unit{throw A()}

func main(){
    var a : Future<Unit> = spawn {test()}
    sleep(10000000)

    let res = a.getResult()
    match (res) {
        case Ok(val) => print("get something\n")
        case Err(_) => print("None\n")
    }
    return 0
}