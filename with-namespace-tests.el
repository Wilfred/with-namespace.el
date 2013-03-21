(require 'ert)
(require 'with-namespace)

(ert-deftest with-namespace-defun-rename ()
  "Test that `defun' functions are renamed."
  (should
   (equal
    (macroexpand
     '(with-namespace "test"
        (defun foo () 1)))
    '(progn
       (defun test-foo () 1)))))

(ert-deftest with-namespace-external-unchanged ()
  "Test that external function calls are not rewritten."
  (should
   (equal
    (macroexpand
     '(with-namespace "test"
        (defun foo () (message "hello world!"))))
    '(progn
       (defun test-foo () (message "hello world!"))))))

(ert-deftest with-namespace-reference-other-internal ()
  "Test that one function within a namespace can call another with qualifying the name."
  (should
   (equal
    (macroexpand
     '(with-namespace "test"
        (defun bar () (foo))
        (defun foo () (message "hello world!"))))
    '(progn
       (defun test-bar () (test-foo))
       (defun test-foo () (message "hello world!"))))))

(defun with-namespace-run-tests ()
  "Run all unit tests for with-namespace.el"
  (interactive)
  (ert-run-tests-interactively "with-namespace-"))

