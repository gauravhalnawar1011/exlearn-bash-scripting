
---


# Day 01 — Shell Basics & Script Execution

##  Objective
By the end of this session, you should:
- Understand different shells in Linux
- Know how to check and install shells
- Understand `type` vs `which`
- Know what built-in commands are
- Be able to run Bash scripts correctly

---

#  1. What is a Shell?

A shell is a command-line interpreter that allows you to interact with the OS.

---

## Common Shells:

| Shell | Description |
|------ |------------|
| bash  | Default shell in most Linux systems |
| sh    | Basic shell (POSIX compliant) |
| zsh   | Advanced shell with better features |
| fish  | User-friendly interactive shell |

---

#  2. List Available Shells

```bash
cat /etc/shells
````

 Shows all installed shells in the system

---

#  3. Check Current Shell

```bash
echo $SHELL
```

or

```bash
ps -p $$
```

---

#  4. Install New Shell

### Example (Ubuntu/Debian):

```bash
sudo apt update
sudo apt install zsh
```

---

## Change Default Shell:

```bash
chsh -s /bin/zsh
```

 Logout/Login required

---

#  5. `which` vs `type` Command

## `which` Command

```bash
which ls
```

 Shows path of executable

---

## `type` Command

```bash
type ls
```

 Tells:

* Whether command is built-in
* Alias
* External binary

---

## Example:

```bash
type cd
```

Output:

```
cd is a shell builtin
```

---

#  Difference

| Feature         | which | type |
| --------------- | ----- | ---- |
| Shows path      | ✅     | ✅    |
| Detects builtin | ❌     | ✅    |
| Detects alias   | ❌     | ✅    |

---

#  6. Built-in Commands

Built-in commands are part of the shell itself.

### Examples:

```bash
cd
echo
pwd
```

---

## Why Built-ins Matter?

* Faster execution (no external process)
* Essential for shell operations
* Used heavily in scripting

---

#  7. How to Run a Script

Assume script name: `script.sh`

---

## Method 1:

```bash
bash script.sh
```

 Runs using bash interpreter explicitly

---

## Method 2:

```bash
./script.sh
```

 Runs script directly

 Requires:

```bash
chmod +x script.sh
```

---

## Method 3:

```bash
/home/user/script.sh
```

 Absolute path execution

---

#  8. Difference Between Execution Methods

| Method            | Behavior                     |
| ----------------- | ---------------------------- |
| `bash script.sh`  | Uses bash explicitly         |
| `./script.sh`     | Uses shebang (`#!/bin/bash`) |
| `/path/script.sh` | Same as above but full path  |

---

#  9. Shebang (Important)

```bash
#!/bin/bash
```

 Tells system which interpreter to use

---

## Example Script:

```bash
#!/bin/bash
echo "Hello World"
```

---

#  10. Permissions (Quick Recap)

```bash
chmod +x script.sh
```

 Makes script executable

---

#  Hands-On Lab

## Task 1:

```bash
cat /etc/shells
```

 List all shells

---

## Task 2:

```bash
echo $SHELL
```

 Check current shell

---

## Task 3:

```bash
type cd
which ls
```

 Compare output

---

## Task 4:

Create a script:

```bash
#!/bin/bash
echo "My first script"
```

Run using:

```bash
bash script.sh
./script.sh
```

---

#  Common Mistakes

* Forgetting `chmod +x` 
* Not adding shebang 
* Confusing `which` and `type` 
* Not understanding shell difference 

---


