# File Masquerading Demos

## Right-To-Left

Demonstrates the usage of the unicode `\u202E`.

This demo utilizes [bun](https://bun.sh/) to execute [TypeScript](https://www.typescriptlang.org/) code and works only on Linux/Unix-alike.

### Demo

Create the "malicous" file via:

```shell
bun demo-rtl.ts
```

You should now have an executable shell script file displayed as `solution_maths.jpg` (depends on your terminal/file explorer if unicode is enabled and/or this unicode symbol is blacklisted).

Double click on it should open a terminal and execute code, if the file extension `.sh` is correctly assigned to the console.

## Break Process Tree

To evade detection based on process tree analysis you can spawn a child process and terminate the parent process.
Any orphaned process will be picked up by `init` (PID 1).

This demo works only on Linux/Unix-alike.

### Demo

To start the process run:

```shell
sh ./demo-break-process-tree.sh
```

Now execute:

```shell
ps -ef --forest
```

You should be able to find the process you started by looking for the command `sh ./demo-break-process-tree.sh` and `sleep 20` (main, parent) / `sleep 120` (child).

Once the main process exits (`sleep 20`), you should run the command `ps -ef --forest` again and find the child process that has been spawned (`sleep 120`).
It should now have been assigned to `init` with Parent PID = 1.
