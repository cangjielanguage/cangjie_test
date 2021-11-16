// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

func hasException(lamb: () -> Result<Location>): Bool {
    match (lamb()) {
        case Ok(v) => return false
        case Err(e) => return true
    }
}

func main() : Int64 {
    let mylocations = ["Europe/New_York", "America/ABCD","/Los_Angeles", "America/LosAngeles", "America/Los Angeles",
    "America/Los_Angeles America/New_York","America\\New_York", "Europe", "local", "utc", ".", " "]

    for (location in mylocations) {
        var mylocation = Location.load(location)
       
        if (!hasException({ Location.load(location) })) {
            print("Failure\n")
            print("location: " + location + "\n")
        }
    }

    return 0
}
