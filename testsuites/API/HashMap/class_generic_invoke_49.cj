// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output  2>&1 | compare %f

from std import collection.*
class Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var MapWidth: HashMap<Int32, String> =HashMap<Int32, String>([(1,"Aa"),(2,"Bb"),(3,"Cc"),(1,"fir")])
    let data: Data<HashMap<Int32, String>> = Data<HashMap<Int32, String>>(MapWidth)
    var res = data.width
    if (res == MapWidth) {   // EXPECTED: regex error.*?'==' is not a member of class 'HashMap'
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
