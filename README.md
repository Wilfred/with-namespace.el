;;; with-namespace.el --- interoperable elisp namespaces

;; Copyright (C) 2013 Wilfred Hughes

;; Author: Wilfred Hughes <me@wilfred.me.uk>
;; Version: 1.1
;; Keywords: namespaces
;; Package-Requires: ((dash "1.1.0") (loop "1.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary

;; Many elisp packages already use `my-project-foo' and
;; `my-project--internal-bar' naming conventions. `with-namespace'
;; allows you to define a collection of functions, variables etc
;; without having to write the prefix in front of every symbol.

;; It works by simply rewriting all the symbols of top-level
;; definitions, so the following code:

;; (with-namespace "my-project"
;;     (defun foo () (-greet "world"))
;;     (defun -greet (thing) (format "hello %s" thing))
;;     (defvar bar 3 "some docstring"))

;; compiles to:

;; (defun my-project-foo () (my-project--greet "world"))
;; (defun my-project--greet (thing) (format "hello %s" thing))
;; (defvar my-project-bar 3 "some docstring")

;; By producing code that many elisp developers would write anyway,
;; `with-namespace' does not require downstream users to even know
;; about it.

;;; Todo

;; * Document
;; * Explore importing from other namespaces (everything, public only, named only)

;;; Changelog

;; 1.1 -- Added support for defmacro, defconst and defstruct, and
;; allow more to be added by the user
;; 1.0 -- Initial release

;;; Similar projects

;; * https://github.com/skeeto/elisp-fakespace/
;; * https://github.com/sigma/codex
