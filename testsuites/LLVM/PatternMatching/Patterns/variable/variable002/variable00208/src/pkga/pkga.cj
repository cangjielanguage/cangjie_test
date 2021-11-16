
package pkga

external func test(x: Int32):String{
    var grade: String
    if (x > 60) {
        grade = "good"
    } else {
        grade = "bad"
    }
    return grade
}