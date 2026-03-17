
---

#  Day 02 — Bash Variables

##  Objective
By the end of this session, you should:
- Understand how variables work in Bash
- Avoid common beginner mistakes
- Use variables in real scripts (not just echo)

---

#  1. What is a Variable?

A variable is a named reference to a value.

### Example:
```bash
name="Gaurav"
echo $name
````

---

#  2. Rules (Important)

###  Wrong:
```bash
name = "Gaurav"
```

###  Correct:

```bash
name="Gaurav"
```

 No spaces around `=`

---

###  Wrong:

```bash
echo name
```

###  Correct:

```bash
echo $name
```

 Use `$` to access variable value

---

#  3. Types of Variables

## String

```bash
course="DevOps"
```

## Integer

```bash
count=10
```

## Command Output

```bash
user=$(whoami)
```

---

#  4. Environment Variables

These are system-level variables.

### Examples:

```bash
echo $HOME
echo $USER
echo $PATH
```

---

## Local vs Environment

| Type        | Description           |
| ----------- | --------------------- |
| Local       | Only inside script    |
| Environment | Available system-wide |

---

#  5. Export Variables

```bash
export project="bash_training"
echo $project
```

---

#  6. User Input

```bash
read name
echo "Hello $name"
```

### Better:

```bash
read -p "Enter your name: " name
```

---

#  7. Command Substitution

```bash
today=$(date)
echo $today
```

---

#  8. Variable Scope

## Local:

```bash
name="test"
```

## Exported:

```bash
export name="test"
```

---

#  9. Special Variables

| Variable | Meaning             |
| -------- | ------------------- |
| $0       | Script name         |
| $1       | First argument      |
| $2       | Second argument     |
| $#       | Number of arguments |
| $@       | All arguments       |
| $?       | Last command status |
| $$       | Process ID          |

### Example:

```bash
echo "Script: $0"
echo "Arg1: $1"
echo "Total args: $#"
```

---

#  10. Readonly Variables

```bash
readonly pi=3.14
```

---

#  11. Unset Variable

```bash
unset name
```

---

#  12. Quotes

## Double Quotes:

```bash
name="Gaurav"
echo "Hello $name"
```

 Variable is evaluated

---

## Single Quotes:

```bash
echo 'Hello $name'
```

 Output:

```
Hello $name
```

---

#  13. Best Practices

* Use meaningful names:

  ```bash
  user_name="gaurav"
  ```
* Always quote variables:

  ```bash
  echo "$user_name"
  ```
* Avoid overwriting system variables like `PATH`

---

#  Hands-On Lab

## Task 1:

```bash
read -p "Enter name: " name
read -p "Enter age: " age
echo "User $name is $age years old"
```

---

## Task 2:

```bash
user=$(whoami)
date=$(date)
echo "User: $user"
echo "Date: $date"
```

---

## Task 3:

```bash
echo "Welcome $1"
```

Run:

```bash
./script.sh DevOps
```

---

#  Common Mistakes

* Using spaces in assignment 
* Forgetting `$` 
* Not quoting variables 
* Mixing single & double quotes 
* Not understanding scope 

---




