// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure

from std import time.*

func hasException(lamb: () -> Result<Time>): Bool {
    match (lamb()) {
        case Ok(v) =>
            return false
        case Err(e) =>
            return true
    }
}

func main() : Int64 {
    let timeEnum = [("2020-", "yyyy-"),
                    ("2020-", "yyyyM-"),
                    ("2020-02-", "yyyy-MM-"),
                    ("2020-02-10-", "yyyy-MM-dd-"),
                    ("2020-02-10", "yyyy-MM-dds"),
                    ("2020-02-10T08:", "yyyy-MM-ddThhm:"),
                    ("2020-02-10T08:30:", "yyyy-MM-ddThh:mms:"),
                    ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mm:ssm"),
                    ("2020-02-10T08:30:00", "yyyy-mmd-ddThh:mm:ss"),
                    ("2020-02-10T08:30:00", "yyyy-MMd-ddThh:mm:ss"),
                    ("2020-02-10T08:30:00", "yyyy-MM-MdThh:mm:ss"),
                    ("2020-02-10T08:30:00", "yyyy-ddy-MMThh:mm:ss"),
                    ("2020-02-10T08:30:00", "yyyy-MM-ddThhm:mm:ss"),
                    ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mms:ss"),
                    ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mm:mss"),
                    ("2020-02-10T08:30:00+08:00", "yyyy-MM-ddThh:mm:ssZZZZs")]

    for (dateTime in timeEnum) {
        if (!hasException({ Time.parse(dateTime[0], dateTime[1]) })) {
            print("Failure: " + dateTime[1] + "\n")
        }
    }

    return 0
}
