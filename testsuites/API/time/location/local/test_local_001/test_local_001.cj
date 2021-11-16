// DEPENDENCE: test.sh
// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: a=`bash test.sh` && b=`%stdx_run %stdx_run_opt %output %stdx_run_args` && if [ "$a" = "$b" ];then echo "pass";fi | compare %f
// ASSERT: scan pass

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        var mytime = Time.now(Location.Local)
        var myzone = mytime.zone()
        var myzonename = myzone[0]
        var myzoneoffset = myzone[1].toString()

        print(myzonename + " " + myzoneoffset)

        return 0
    }
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}
