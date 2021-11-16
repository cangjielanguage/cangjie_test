// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan OK\nFINISH\nFINISH\n
// ASSERT: scan-not Exception

from std import sync.*

foreign func testfunc(): Int64

func main(): Int64 {
    let fut: Future<Unit> = spawn {
        var tid1 = 0
        var tid2 = 0
        BindOSThread()
        unsafe { tid1 = testfunc() }
        let fut: Future<Unit> = spawn {
            sleep(1000*1000*1000)
        }
        let res: Result<Unit> = fut.getResult()
        unsafe { tid2 = testfunc() }

        if (tid1 == tid2) {
            print("OK\n")
        } else {
            print("FAIL\n")
        }
        UnbindOSThread()

        match (res) {
            case Ok(val) => print("FINISH\n")
            case Err(e) => print("Exception occured: ${e}\n")
        }
    }

    let res: Result<Unit> = fut.getResult()

    match (res) {
        case Ok(val) => print("FINISH\n")
        case Err(e) => print("Exception occured: ${e}\n")
    }

    return 0
}
