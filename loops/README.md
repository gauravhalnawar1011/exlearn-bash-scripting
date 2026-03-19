
---

#  Day 04 — Loops in Bash

##  Objective
By the end of this session, you should:
- Automate repetitive tasks using loops
- Understand different loop types (`for`, `while`, `until`)
- Control loop execution using `break` and `continue`
- Apply loops in real-world scenarios (files, numbers, automation)

---

#  1. Why Loops?

Loops allow you to repeat tasks automatically.

 Real-world examples:
- Process multiple files
- Run checks on multiple servers
- Automate bulk operations

Without loops → No automation.

---

#  2. for Loop (Most Used)

## Syntax:
```bash
for var in list
do
    command
done
````

---

## Example 1 (Numbers):

```bash id="r4q2mz"
for i in 1 2 3 4 5
do
    echo "Number: $i"
done
```

---

## Example 2 (Range):

```bash id="5y7r9s"
for i in {1..5}
do
    echo "Value: $i"
done
```

---

## Example 3 (Files):

```bash id="h2p9jx"
for file in *.txt
do
    echo "File: $file"
done
```

---

#  3. while Loop

## Syntax:

```bash
while [ condition ]
do
    command
done
```

---

## Example:

```bash id="n7k3wf"
count=1

while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))
done
```

---

#  4. until Loop

Runs until condition becomes true (opposite of while)

## Syntax:

```bash
until [ condition ]
do
    command
done
```

---

## Example:

```bash id="p4t8dv"
count=1

until [ $count -gt 5 ]
do
    echo "Count: $count"
    ((count++))
done
```

---

#  5. break Statement

Stops the loop immediately

```bash id="w6x3lb"
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        break
    fi
    echo $i
done
```

---

#  6. continue Statement

Skips current iteration

```bash id="x8z1qa"
for i in {1..5}
do
    if [ $i -eq 3 ]
    then
        continue
    fi
    echo $i
done
```

---

#  7. Loop with Command Output

```bash id="q3m7pl"
for user in $(cut -d: -f1 /etc/passwd)
do
    echo "User: $user"
done
```

---

#  8. Nested Loops

```bash id="k9r2fw"
for i in {1..3}
do
    for j in {1..2}
    do
        echo "i=$i j=$j"
    done
done
```

---

#  9. Best Practices

* Always quote variables when needed:

  ```bash
  echo "$file"
  ```
* Avoid infinite loops unless intentional
* Keep loops simple and readable
* Debug step-by-step

---

# 🧪 Hands-On Lab

## Task 1:

Create 10 files:

```bash id="z1p4rm"
for i in {1..10}
do
    touch file$i.txt
done
```

---

## Task 2:

Print numbers 1 to 10 using while loop:

```bash id="m8t6dn"
count=1

while [ $count -le 10 ]
do
    echo $count
    ((count++))
done
```

---

## Task 3:

Check all `.log` files:

```bash id="c7v9xs"
for file in *.log
do
    echo "Checking $file"
done
```

---

## Task 4:

Skip number 5:

```bash id="b2n8kf"
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        continue
    fi
    echo $i
done
```

---

## Task 5:

Stop loop at 7:

```bash id="y5r3qa"
for i in {1..10}
do
    if [ $i -eq 7 ]
    then
        break
    fi
    echo $i
done
```

---

#  Common Mistakes

* Infinite loops due to wrong condition 
* Forgetting to increment variable 
* Not quoting variables 
* Using wrong loop type 
* Overcomplicating nested loops 

---

#  Reality Check

If you don’t understand loops:

* You cannot automate anything
* You’ll write repetitive manual commands
* You’ll fail in real DevOps work

Loops are where scripting actually starts.

Master this.



