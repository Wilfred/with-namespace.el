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

(defun with-namespace-run-tests ()
  "Run all unit tests for with-namespace.el"
  (interactive)
  (ert-run-tests-interactively "with-namespace-"))

