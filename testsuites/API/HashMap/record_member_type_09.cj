// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: regex key: 1;value: Aa
// ASSERT: regex key: 2;value: Bb
// ASSERT: regex key: 3;value: Cc

from std import collection.*
record Data {
    let width: HashMap<Int32, String> = HashMap<Int32, String>([(1,"Aa"),(2,"Bb"),(3,"Cc")])
}

func run(): Int64 {
    var res: HashMap<Int32, String> = Data().width
    for (item in res) {
        print("key: " + item[0].toString() + ";" + "value: " + item[1] + "\n")
    }
    return 0
}

func main(): Int64 {
    return run()
}
