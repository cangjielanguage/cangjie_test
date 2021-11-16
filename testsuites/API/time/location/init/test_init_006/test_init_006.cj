// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

func hasException(lamb: () -> Result<Time>): Bool {
    match (lamb()) {
        case Ok(v) => return false
        case Err(e) => return true
    }
}

func main() : Int64 {
    let mylocation = ["/Astrakhan", "123", "abc", ""]

    var offset = -28800
    for (location in mylocation) {
        var loc1 = Location(location, Int32(offset))
        var loc2 = Location(location, Duration.second(offset))

        var now = Time.now()
        var time1 = now.inZone(loc1)
        var time2 = now.inZone(loc2)
    }

    return 0
}