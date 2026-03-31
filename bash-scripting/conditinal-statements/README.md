
---

#  Day 03 — Conditions & Operators in Bash

##  Objective
By the end of this session, you should:
- Make decisions in scripts using `if`
- Use comparison operators correctly
- Validate inputs and files
- Write logic-based scripts (real automation mindset)

---

# 🔹 1. Why Conditions?

Without conditions, scripts are useless.

  Real-world example:
- Check if file exists
- Validate user input
- Check disk usage
- Decide what action to take

---

#  2. Basic if Statement

```bash
if [ condition ]
then
    command
fi
````

---

## Example:

```bash
num=10

if [ $num -gt 5 ]
then
    echo "Number is greater than 5"
fi
```

---

#  3. if-else

```bash
if [ condition ]
then
    command
else
    command
fi
```

---

## Example:

```bash
num=3

if [ $num -gt 5 ]
then
    echo "Greater"
else
    echo "Smaller"
fi
```

---

#  4. if-elif-else

```bash
if [ condition ]
then
    command
elif [ condition ]
then
    command
else
    command
fi
```

---

## Example:

```bash
num=10

if [ $num -lt 5 ]
then
    echo "Less than 5"
elif [ $num -eq 10 ]
then
    echo "Equal to 10"
else
    echo "Other"
fi
```

---

#  5. Comparison Operators

## Numeric Operators

| Operator | Meaning          |
| -------- | ---------------- |
| -eq      | Equal            |
| -ne      | Not equal        |
| -gt      | Greater than     |
| -lt      | Less than        |
| -ge      | Greater or equal |
| -le      | Less or equal    |

---

## String Operators

| Operator | Meaning      |
| -------- | ------------ |
| =        | Equal        |
| !=       | Not equal    |
| -z       | Empty string |
| -n       | Not empty    |

---

## Example:

```bash
name="Gaurav"

if [ "$name" = "Gaurav" ]
then
    echo "Match"
fi
```

---

# 🔹 6. File Conditions (Very Important)

| Condition | Meaning          |
| --------- | ---------------- |
| -f        | File exists      |
| -d        | Directory exists |
| -e        | Exists           |
| -r        | Readable         |
| -w        | Writable         |
| -x        | Executable       |

---

## Example:

```bash
file="test.txt"

if [ -f "$file" ]
then
    echo "File exists"
else
    echo "File not found"
fi
```

---

# 🔹 7. Logical Operators

| Operator | Meaning |
| -------- | ------- |
| -a       | AND     |
| -o       | OR      |
| !        | NOT     |

---

## Example:

```bash
age=25

if [ $age -gt 18 ] && [ $age -lt 60 ]
then
    echo "Valid age"
fi
```

---

# 🔹 8. Nested Conditions

```bash
num=15

if [ $num -gt 10 ]
then
    if [ $num -lt 20 ]
    then
        echo "Between 10 and 20"
    fi
fi
```

---

#  9. Best Practices

* Always use quotes:

  ```bash
  if [ "$name" = "Gaurav" ]
  ```
* Leave spaces inside `[ ]`
* Avoid writing complex logic in one line initially

---

#  Hands-On Lab

## Task 1:

```bash
read -p "Enter number: " num

if [ $num -gt 0 ]
then
    echo "Positive"
else
    echo "Negative or Zero"
fi
```

---

## Task 2:

```bash
read -p "Enter filename: " file

if [ -f "$file" ]
then
    echo "File exists"
else
    echo "File not found"
fi
```

---

## Task 3:

```bash
read -p "Enter username: " name

if [ -z "$name" ]
then
    echo "Empty input"
else
    echo "Hello $name"
fi
```

---

## Task 4:

```bash
read -p "Enter number: " num

if [ $num -gt 50 ]
then
    echo "Greater than 50"
elif [ $num -eq 50 ]
then
    echo "Equal to 50"
else
    echo "Less than 50"
fi
```

---

#  Common Mistakes

* Missing spaces inside `[ ]` 
* Not using quotes 
* Using `=` instead of `-eq` for numbers 
* Confusing file conditions 
* Writing unreadable nested logic 

---

# Reality Check

If you don’t understand conditions:

* You cannot write automation scripts
* You cannot handle real-world scenarios
* You’ll fail in DevOps tasks

```

---

