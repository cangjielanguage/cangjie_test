// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    var scoreResult2: String = match (100) {
        case 60 => "pass"
        case 100 => "Full"
        case good => "score: ${good}, excellent "
    }
    if (scoreResult == "score: 90, excellent " && scoreResult2 == "Full") {
        return 0
    }
    return 1
}

