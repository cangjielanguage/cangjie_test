// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan FINISH\n
// ASSERT: scan-not Exception

from std import sync.*

foreign func testfunc(): Int64

func main(): Int64 {
    var i: Int64 = 0
    let mtx: Mutex = Mutex()
    let cdt : Condition = mtx.newCondition()

    while (i < 1000) {
        spawn {
            BindOSThread()
            mtx.lock()
            cdt.wait()
        }
        i = i + 1
    }

    sleep(1000*1000*1000)
    var tid = 0
    unsafe{ tid = testfunc() }
    print("FINISH\n")
    return 0
}
