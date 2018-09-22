# Top-level vs. local definitions
Top-level declarations are not nested within anything else and they are in scope throughout the whole module

# List functions
*cons* the : operator is called cons and it builds up a list
    
    'c' : "hris"
    "chris"

    'P' : ""
    "P"

*head* returns the first element of a list

    head "Papuchon"
    'P'

*tail* returns the list with its head chopped of

    tail "Papuchon"
    "apuchon"

*take* returns the specific amount of elements starting at the head

    take 1 "Papuchon"
    "P"
    take 0 "Papuchon"
    ""
    take 6 "Papuchon
    "Papuch"

*drop* returns the list after the specific amount of elements have been dropped from the head

    drop 4 "Papuchon"
    "chon"
    drop 9000 "Papuchon"

*!!* returns the element at the specific position

    "Papuchon" !! 4
    'c'
