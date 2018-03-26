## Task
Hello World using `execute` resource

## Steps:
- generate cookbook with `chef generate cookbook gl_lab3` command
- Add Vagrantfile to root of your cookbook folder
- cd cookbook folder
- Up/Provision your machine
- Edit recipes/default.rb.
 - Create user 'devops'
 - Create file '/opt/hello' that contains "Hello, DevOps!"
 - make user devops own file '/opt/hello'
 - make sure no one except user 'devops' can write into file
- Refactor code.
 - Add guards to achieve idempotency.
 - Move username, filename to recipe variables
 - Move recipe variables to cookbook variables

## Checklist:
- you have file `/opt/hello` with "Hello, DevOps!" line.
- file owned by user `devops` with `755` permissions

## Tips:
- https://docs.chef.io/resource_execute.html
- Use only `execute` resource
- Use guards
- Use `vagrant provision` to check any change you'v added
- Use `vagrant up` after you think you'v done to check machine converges from scratch
