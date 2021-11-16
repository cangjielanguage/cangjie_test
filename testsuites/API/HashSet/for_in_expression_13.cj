// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f  -o %output 2>&1 | compare %f

from std import collection.*
func main():Int64 {
    if ( case01() != 10 ) {
        return 1
    }
    if ( case02() != 3 ) {
        return 2
    }
    if ( case03() != 21 ) {
        return 3
    }
    return 0
}

func case01(){
    let intSet = HashSet<Int64>([0,1,2,3,4])
    var a: Int64 = 0
    for (item in intSet) {
        a = a + item
    }
    a
}

func case02(){
    let intSet1 = HashSet<Int64>([0,1,2])
    let intSet = HashSet<HashSet<Int64>>([intSet1, intSet1,intSet1])}  // EXPECTED: regex error.*?no matching constructor for call 'HashSet'
    var a: Int64 = 0
    for (item in intSet) {
        for (itemsub in item) {
            a = a + itemsub
        }
    }
    a
}

func case03(){
    let intSet1 = HashSet<Int64>([0,1,2])
    let intSet2 = HashSet<Int64>([3, 4, 5,6])
    let intSet3 = HashSet<Int64>([3, 4, 5,6])
    let intSet = HashSet<HashSet<Int64>>([intSet1, intSet2,intSet3])}  // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var a: Int64 = 0
    for (item in intSet) {
        for (itemsub in item) {
            a = a + itemsub
        }
    }
    a
}


