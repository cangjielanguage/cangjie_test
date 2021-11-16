// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before_getResult!first sync!
// ASSERT: scan after_getResult!lock!

from std import sync.*

let mtx: Mutex = Mutex()

func main(): Int64 {
    let f = spawn {
             synchronized(mtx){
                print("first sync!")
                throw Throwable()
                print("after throw!")
             }
        }
    print("before_getResult!")
    match (f.getResult()) {
        case Ok(v) => print("Success!")
        case Err(e) => e.printStackTrace()
    }
    print("after_getResult!")
    mtx.lock()
    print("lock!")

    return 0
}
