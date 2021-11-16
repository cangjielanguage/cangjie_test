// EXEC: %compiler %stdx_cmp_opt -backend-options="%link-time %stdx-sync-link" %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

from std import time.*

class TestParseFormat {
    func testTimeParse() {
        let mylocation = ["Africa/Abidjan","Africa/Accra","Africa/Addis_Ababa","Africa/Algiers","Africa/Asmara",
        "Africa/Bamako","Africa/Bangui","Africa/Banjul","Africa/Bissau","Africa/Blantyre","Africa/Brazzaville",
        "Africa/Bujumbura","Africa/Cairo","Africa/Casablanca","Africa/Ceuta","Africa/Conakry","Africa/Dakar",
        "Africa/Dar_es_Salaam","Africa/Djibouti","Africa/Douala","Africa/El_Aaiun","Africa/Freetown",
        "Africa/Gaborone","Africa/Harare","Africa/Johannesburg","Africa/Juba","Africa/Kampala","Africa/Khartoum",
        "Africa/Kigali","Africa/Kinshasa","Africa/Lagos","Africa/Libreville","Africa/Lome","Africa/Luanda",
        "Africa/Lubumbashi","Africa/Lusaka","Africa/Malabo","Africa/Maputo","Africa/Maseru","Africa/Mbabane",
        "Africa/Mogadishu","Africa/Monrovia","Africa/Nairobi","Africa/Ndjamena","Africa/Niamey","Africa/Nouakchott",
        "Africa/Ouagadougou","Africa/Porto-Novo","Africa/Sao_Tome","Africa/Tripoli","Africa/Tunis","Africa/Windhoek"]

        let myoffset = [0, 1*60*60, 2*60*60, 3*60*60, 4*60*60, 5*60*60, 6*60*60, 7*60*60, 8*60*60, 9*60*60, 10*60*60, 11*60*60, 12*60*60,
        -1*60*60, -2*60*60, -3*60*60, -4*60*60, -5*60*60, -6*60*60, -7*60*60, -8*60*60, -9*60*60, -10*60*60, -11*60*60]

        for (location in mylocation) {
            for (offset in myoffset) {
                var loc1 = Location(location, Int32(offset))
                var loc2 = Location(location, Duration.second(offset))
                assertEqual(loc1.toString(), loc2.toString(), "Comparing the result of init(), the location is ${location}, the offset is ${offset}\n")

                var now = Time.now()
                var time1 = now.inZone(loc1)
                var time2 = now.inZone(loc2)
                assertEqual(time1.toString(), time2.toString(), "Comparing the result of init(), the location is ${location}, the offset is ${offset}\n")
            }
        }
        return 0
    }
}

func assertEqual(result : String, expected : String, msg : String) : Bool {
    if (result != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${result}\n")
        return true
    }
    return false
}

func main() : Int64 {
    let cases : TestParseFormat = TestParseFormat()
    return cases.testTimeParse()
}