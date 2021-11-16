
package pkga

var score: Int32 = 90
external var scoreResult: String = match (score) {
    case 60 => "pass"
    case 100 => "Full"
    case good => "score: ${good}, excellent "
}
