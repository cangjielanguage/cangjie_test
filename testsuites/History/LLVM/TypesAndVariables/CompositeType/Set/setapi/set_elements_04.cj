// EXEC: %compiler %cmp_opt %f -o %output

func main(): Int64 {
    if (case01() != 21 ){
        return 1
    }
    return 0
}

func case01(){
    var a = 0
    let intSet1 = #{0, 1, 2}
    let intSet2 = #{3, 4, 5,6}
    let intSet3 = #{3, 4, 5,6}
    let intSet = #{#{intSet1}, #{intSet2},#{intSet3}} //#{#{#{0,1,2,3,4,5,6}}}
    for (item in intSet) {
        for (itemsub in item) {
            for (i in itemsub) {
                a = a + i
            }
        }
    }
    a
}

