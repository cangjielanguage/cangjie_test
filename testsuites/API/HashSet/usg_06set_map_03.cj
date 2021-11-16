// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
	var map1 = HashMap<Int64,Bool>([(1,true),(2,false)])
	var map2:HashMap<Int64,String> =HashMap<Int64,String>([(2,"a"),(2,"b"),(3,"b")])
	let map3 =HashMap<String,Char>([("a",'2'),("b",'2'),("c",'r')])

    var tmp1 = ""
	for ((key1,value1) in map1) {
	    tmp1 = tmp1 + key1.toString() + value1.toString()
	}
	if ( tmp1 != "1true2false") {
        return 1
	}

    var tmp2 = ""
	for ((key2,value2) in map2) {
	    tmp2 = tmp2 + key2.toString() + value2.toString()
	}
	if ( tmp2 != "2b3b") {
        return 1
	}

	var tmp3 = ""
	for ((key3,value3) in map3) {
	    tmp3 = tmp3 + key3 + value3.toString()
	}
	if ( tmp3 != "a2b2cr") {
        return 1
	}

	return 0
}