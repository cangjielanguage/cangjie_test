// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure

from std import time.*

func hasException(lamb: () -> Result<Time>): Bool {
    match (lamb()) {
        case Ok(v) => return false
        case Err(e) => return true
    }
}

func main() : Int64 {

    let timeEnum = ["23:60:00","00:61:10"]

    for (dateTime in timeEnum) {
        if (!hasException({ Time.parse(dateTime,"HH:mm:ss") })) {
            print("Failure")
        }
    }

    return 0
}