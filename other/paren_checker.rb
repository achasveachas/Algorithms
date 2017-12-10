# A method that takes in a string with parentheses and checks to make sure that the parenthese are properly formatted

OPENERS = ["(", "[", "{"]
CLOSERS = [")", "]", "}"]
VERSATILES = ["\"", "`"]
MATCHERS = {
    "(" => ")",
    "[" => "]",
    "{" => "}"
}

def paren_checker(string)

    stack = []

    string.split("").each do |char|
        if OPENERS.include?(char)
            stack.push(char)
            
        elsif CLOSERS.include?(char)
            if MATCHERS[stack.last] == char 
                stack.pop
            else
                break
            end 

        elsif VERSATILES.include?(char)
            if stack.last == char
                stack.pop
            else
                stack.push(char)
            end 
            
        end
        puts stack.join(", ")
    end
    # Return true if the stack is empty (no opening parentheses left)
    stack.size == 0
end