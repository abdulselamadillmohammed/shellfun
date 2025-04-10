#!/bin/bash
# General idea: Have two lists where one list holds the data and the 
# Same index on the other list will give the address to the next node
# in the list

# This idea is not valid because you will need to allocate a static amount
# Of area in the List initally by declaring space which doesn't solve the 
# Problem of dynamic memory allocation which the linked list implementation
# Originally solves. So... Try another approach

# On second thought, you are not making a linked list in C, the insertion
# Process is much like that of python dictionaries (hashmaps in a sense)
# The original implementation should work fine however likely not as 
# efficient as C. 

LST=()
INX=()

head=-1 # Holds an index
index=0 # Contains the index for the current node


# The following function performs insertion operations on the linked list
ll_append(){
    local value="$1" # Get the first value which is the argument passed which is ideally the data for the node
    LST[index]="$value"
    INX[index]=-1

    if [ $head -eq -1 ]; then # first insert
        head=$index
    else
        local i=head
        while [ "${INX[i]}" -ne -1 ]; do
            i=${INX[$i]}
        done
        INX[$i]=$index
    fi
    ((index++))
}


# The following function prints all the elements within the linked list
linked_list_traverse() {
    # Check if list is empty
    if [ $head -eq -1 ]; then 
        echo "You have reached the end of the Linked list"
        return
    fi 
    local i=$head
    echo "Linked List Contents:"
    while [ $i -ne -1 ]; do
        echo "${LST[$i]}"
        i=${INX[$i]}
    done
}



# Testing

ll_append "please"
ll_append "sort"
ll_append "this"
ll_append "small"
ll_append "list"
ll_append "of"
ll_append "words"


linked_list_traverse