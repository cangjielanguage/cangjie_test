// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output  2>&1 | compare %f


from std import collection.*
record Data<T> {
    let width: T

    Data(x: T){
        width = x
    }
}

func run(): Int64 {
    var HashMapWidth: HashMap<Int32, String> = HashMap<Int32, String>([(1 , "Aa"),( 2 , "Bb"),(3 , "Cc"),(1 ,"fir")])
    let data: Data<HashMap<Int32, String>> = Data<HashMap<Int32, String>>(HashMapWidth)
    var res = data.width
    if (res == HashMapWidth) {   // EXPECTED: regex error.*?'==' is not a member of class 'HashMap'
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

