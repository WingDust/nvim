
(module demo
{autoload {nvim aniseed.nvim}}
)

( defn new-split [name]
    (nvim.ex.vsplit name))
 
 ;; (new-split "foo")  
(defn l-word []
  (let [cword (nvim.fn.expand "<cword>")
        ]
    (print cword)
    )
  )
(l-word)
