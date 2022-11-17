
;; (module demo
;; (require {a aniseed.core
;;         nvim  aniseed.nvim}))

( defn new-split [name]
    (nvim.ex.vsplit name))
 
 (new-split "foo")  
