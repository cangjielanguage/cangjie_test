// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}
class B <: Throwable{}

var count = 0

func test(){
    var i = 0
    while (i != 10){
        try {
        if (i==5) {throw A()}
        if (i==8) {throw B()}
        }
        catch (_:A){}
        finally {count++}
        i++
    }
    return count
}

func main() {
    try {
        test()
        ()
    } catch (_:B){
        if (count != 9) { // 8 + 1 = 9
            return count
        }
    }
    return 0
}
