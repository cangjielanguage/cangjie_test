// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main():Int64 {
    if ( case01() != 70 ) {
        return 1
    }
    if ( case02() != 66 ) {
        return 1
    }
    return 0
}

func case01(){
    let map =HashMap<Int64,Int64>([(0,10),(1,11),(2,12),(3,13),(4,14)])
    var a: Int64 = 0
    for ((key,value) in map) {
        a = a + key + value
    }
    a
}
func case02(){
    let map1 =HashMap<Int64,Int64>([(1,1),(10,20)])
    let map =HashMap<Int64,HashMap<Int64,Int64>>([(0,map1),(1,map1)])
    var a: Int64 = 0
    for ((key,value) in map) {
        for ((x,y) in value) {
            a = a + key +  x + y
            print(a.toString()+"\n")
        }
    }
    a
}



