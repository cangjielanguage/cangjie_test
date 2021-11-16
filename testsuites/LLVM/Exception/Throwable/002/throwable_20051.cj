// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A <: Throwable{}
class B <: Throwable{}


func test(){
    var res = 0b0000
    while (true){
        try{
            try{
                var a = ArrayList<Int64>([1])
                a[-1]
                ()
            } catch (_:A){
                res |= 0b0001
            } finally {
                res |= 0b0010
            }
        } catch (_:Exception) {
            res |= 0b0100
        } finally {
            res |= 0b1000
            break
        }
    }
    return res
}

func main() {
    0b1110 - test()
}
