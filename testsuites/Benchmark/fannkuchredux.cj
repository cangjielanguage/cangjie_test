// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package fannkuchredux

// var n : Int64 = 12
// copy from java script version：
// https://github.com/greensoftwarelab/Energy-Languages/blob/master/JavaScript/fannkuch-redux/fannkuchredux.node-4.node

func fannkuch(n!:Int64 = 12) {
    var p = Array<Int64>(n,{input:Int64=>input})
    var q = Array<Int64>(n,{input:Int64=>input})
    var s = Array<Int64>(n,{input:Int64=>input})
    var sign = 1
    var maxflips = 0
    var sum = 0
    var m = n-1

    do {
        //print("${count}\n")
        var q0 = p[0]
        if (q0 != 0) {
            var i = 1
            while (i < n){
                q.set(i,p[i])
                i++
            }
            var flips : Int64 = 1
            do {
                var qq = q[q0]
                if (qq == 0){
                    sum = sign * flips + sum
                    if (flips > maxflips){
                        maxflips = flips
                    }
                    break
                }
                q.set(q0,q0)
                if (q0 >= 3) {
                    var i = 1
                    var j = q0 - 1
                    var t = 0
                    do {
                        t = q[i]; q.set(i, q[j]); q.set(j, t); i++; j--;
                    } while (i < j)
                }
                q0 = qq
                flips++
            } while (true)
        }
        if (sign == 1){
            var t = p[1]; p.set(1, p[0]); p.set(0, t); sign = -1; // rotate 0<-1

        } else {
            var t = p[1]; p.set(1, p[2]); p.set(2, t); sign = 1;  // rotate 0<-1 and 0<-1<-2
            var i = 2
            while (i < n){
                var sx = s[i];
                if (sx != 0) { s.set(i, sx - 1); break; }
                if (i == m) { return [sum, maxflips] }
                s.set(i,i)
                t = p[0]
                var j = 0
                while (j < i+1){
                    p.set(j, p[j+1])
                    j++
                }
                p.set(i+1, t)
                i++
            }
        }
    } while (true)
    return [0,0]
}

func main(){
    var n = 5
    var res = fannkuch(n:n)
    print("${res[0]} \n Pfannkuchen( ${n} ) = ${res[1]}")
    return 0
}

