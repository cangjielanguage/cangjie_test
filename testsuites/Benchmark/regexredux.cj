// DEPENDENCE: small.txt
// EXEC: %compiler %cmp_opt -backend-options="%stdx-package %link-regex" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import io.*
from std import regex.*

let variants = ["agggtaaa|tttaccct",
  "[cgt]gggtaaa|tttaccc[acg]",
  "a[act]ggtaaa|tttacc[agt]t",
  "ag[act]gtaaa|tttac[agt]ct",
  "agg[act]taaa|ttta[agt]cct",
  "aggg[acg]aaa|ttt[cgt]ccct",
  "agggt[cgt]aa|tt[acg]accct",
  "agggta[cgt]a|t[acg]taccct",
  "agggtaa[cgt]|[acg]ttaccct"]

let replacements = [
  (Regex("tHa[Nt]"), "<4>"),
  (Regex("aND|caN|Ha[DS]|WaS"), "<3>"),
  (Regex("a[NSt]|BY"), "<2>"),
  (Regex("<[^>]*>"), "|"),
  (Regex("\\|[^|][^|]*\\|"), "-")
]

let pathname : String = "./small.txt"

func main(){
    var fs : FileStream = FileStream(pathname)
    if (fs.openFile()){
        var toRead: Array<UInt8> = Array<UInt8>(1270835,{i=>UInt8(0)})
        fs.read(toRead)
	    fs.flush()
	    var temp = Array<UInt8>(toRead)
	    var inputLength = temp.size()
	    var str = String.fromUtf8(temp)
        str = Regex(">[^\n]*\n|\n").matcher(str).replaceAll("")
        
        let codeLength = str.utf8View.size()
        var counts = Array<String*Int64>(variants.size(),{x:Int64=>("",0)})
        for (n in 0..variants.size()){
            var temp_count : Int64 = (Regex(variants[n]).matcher(str).findAll()??Array<MatchData>()).size()
            counts[n] = (variants[n], temp_count)
        }
        for (count in counts){
            print(count[0]+" ${count[1]}\n")
        }
        for (rep in replacements){
            str = rep[0].matcher(str).replaceAll(rep[1])
        }
        let resultLength = str.utf8View.size()
        print("${inputLength}\n${codeLength}\n${resultLength}\n")
        
    }
}
