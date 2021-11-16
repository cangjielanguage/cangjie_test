// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spec示例转化

open class A {var a:Int32 = 2}
class B <: A {}

func main(): Int64 {
    let listZero: List<Int32> = []
    let listOne: List<Int32> = [1, 2, 3, 4]
    var listTwo: List<Int64> = [5, 6, 7]
    var listThree: List<Float32>
    listThree = [3.14, 4.14, 5.14]
    var listFour = ["A", "B", "C"]
    var listFive = listThree

    var listSix = [A(), B()]
    let nestedList = [[1, 2, 3, 4], [5, 6, 7]]

    if (listZero.size() != 0) {
        return 1
    }
    if (listOne[2] != 3) {
        return 1
    }
    if (listTwo[2]  != 7) {
        return 1
    }
    if (listThree[listThree.size()-1] != 5.14) {
        return 1
    }
    if (listFour[2] != "C") {
        return 1
    }
    if (listFive[listFive.size()-1] != 5.14) {
        return 1
    }
    if (listSix[1].a != 2) {
        return 1
    }
    if (nestedList[1][0] != 5) {
        return 1
    }
    return 0
}
