// EXEC: %compiler %stdx_cmp_opt -backend-options="%ffiC-link %link-os" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure

from std import os.*
from ffi import c.*

class TestSetArgs {
    func test() {
        let env = ["~", "/", "../", "test_env", "abc", "a b c", "123", "1 2 3",
                  "/root/test/", "../test/", "/home/test"]
       
        var index = 0
        for (e in env) {
            var k = "TEST_ENV" + index.toString()
            setEnv(k, env[index])
            var result = getEnv(k).getOrThrow()
            assertEqual(result, env[index], "Testing setEnv():\n")
            index++
        }
        return 0
    }
}

func assertEqual(result: String, expect: String, msg: String) : Bool {
    if (result != expect) {
        print(msg + "Failure!\nexpect: ${expect}\nresult: ${result}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases: TestSetArgs = TestSetArgs()
    return cases.test()
}
