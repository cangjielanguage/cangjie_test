function sleep(d){  
    let t = Date.now();
    while(Date.now() - t <= d);  
}

function isMoment(a, b, c) {
    z = a + b
    sleep(100);
    z = z + c
    return z
}

module.exports =  isMoment


