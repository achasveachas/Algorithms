function simpleParenthesesChecker(text) {
    
    var openParen = 0

    for(i = 0; i < text.length; i ++) {
        if(text[i] === "(") {
            openParen += 1
        } else if(text[i] === ")") {
            openParen -= 1
        }
        if(openParen < 0)
        return false
    }

    return open === 0
}