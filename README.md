# with-namespace.el --- Poor-man's namespaces for elisp

## Commentary

This is basic defun/defvar rewriting to get most of the benefits of
namespaces (shorter symbols).

## Usage

    (with-namespace "my-project"
      (defvar bar 3 "some docstring")
      (defun foo (x) (+ x bar)))

Compiles to:

    (progn
      (defvar my-project-bar 3 "some docstring")
      (defun my-project-foo (x) (+ x my-project-bar)))

### Todo

* Document
* Unit test
* Explore customising the namespace separator (e.g. / instead of -)
  with a buffer-local variable
* Explore importing from other namespaces (everything, public only, named only)

## Similar projects

* https://github.com/skeeto/elisp-fakespace/
* https://github.com/sigma/codex
