

---


#  Day 05 — Functions & Modular Scripting

##  Objective
By the end of this session, you should:
- Write reusable functions in Bash
- Break scripts into logical blocks
- Pass arguments to functions
- Build clean and maintainable scripts

---

#  1. Why Functions?

Without functions:
- Code becomes repetitive 
- Scripts become messy 
- Hard to debug 

With functions:
 Reusable  
 Clean  
 Easy to maintain  

---

#  2. Basic Function Syntax

```bash
function_name() {
    command
}
````

---

## Example:

```bash id="y4n8pl"
greet() {
    echo "Hello, Welcome!"
}

greet
```

---

#  3. Function with Arguments

```bash id="q8p2mz"
greet() {
    echo "Hello $1"
}

greet Gaurav
```

---

## Multiple Arguments:

```bash id="v1x9ts"
add() {
    result=$(($1 + $2))
    echo "Sum: $result"
}

add 10 20
```

---

#  4. Return Values (Important)

Bash functions don’t return values like other languages.

 They return exit status (0 = success)

```bash id="z6k3wn"
check() {
    return 0
}

check
echo $?
```

---

## Practical Way (Use echo):

```bash id="c2r7yf"
get_sum() {
    echo $(($1 + $2))
}

result=$(get_sum 5 10)
echo "Result: $result"
```

---

#  5. Using Variables Inside Functions

```bash id="k9d4vx"
name="Gaurav"

print_name() {
    echo "Name is $name"
}

print_name
```

---

#  6. Local Variables (Important)

```bash id="w7m1pl"
my_func() {
    local var="inside"
    echo $var
}

my_func
```

 `local` prevents variable conflict

---

#  7. Function + Conditions

```bash id="r5x8zn"
check_file() {
    if [ -f "$1" ]
    then
        echo "File exists"
    else
        echo "File not found"
    fi
}

check_file test.txt
```

---

#  8. Function + Loops

```bash id="t3q9js"
create_files() {
    for i in {1..5}
    do
        touch file$i.txt
    done
}

create_files
```

---

#  9. Modular Script Example

```bash id="h6y2ak"
#!/bin/bash

log_info() {
    echo "[INFO] $1"
}

check_disk() {
    df -h | grep "/"
}

main() {
    log_info "Starting script"
    check_disk
    log_info "Script completed"
}

main
```

---

#  10. Best Practices

* Use meaningful function names:

  ```bash
  check_disk_usage()
  ```
* Keep functions small and focused
* Use `local` variables
* Avoid repeating code

---

# 🧪 Hands-On Lab

## Task 1:

```bash id="b7n2fd"
greet() {
    echo "Hello $1"
}

greet DevOps
```

---

## Task 2:

```bash id="x3m9pl"
square() {
    echo $(($1 * $1))
}

result=$(square 5)
echo $result
```

---

## Task 3:

```bash id="z8t1wr"
check_file() {
    if [ -f "$1" ]
    then
        echo "Exists"
    else
        echo "Not Found"
    fi
}

check_file test.txt
```

---

## Task 4:

```bash id="p4v7ks"
create_users() {
    for user in user1 user2 user3
    do
        echo "Creating $user"
    done
}

create_users
```

---

#  Common Mistakes

* Not calling the function 
* Forgetting `$1`, `$2` inside function 
* Not using `local` variables 
* Writing everything in one big function 
* Expecting return like other languages 

---

#  Reality Check

If you don’t use functions:

* Your scripts will be messy
* You won’t scale automation
* Debugging will become painful

Real DevOps scripts = Modular scripts

Learn this properly.

---
