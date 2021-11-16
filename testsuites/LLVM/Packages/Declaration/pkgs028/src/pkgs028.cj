// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Rectangle

func main(): Int64 {
    let newRectangle = Rectangle(10,20)
    let newWidth = newRectangle.width
    let newLength = newRectangle.length
    if (newWidth == 10 && newLength == 20) {
        return 0
    }
    return 1
}
