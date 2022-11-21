
(module demo
{autoload {nvim aniseed.nvim}}
)

( defn new-split [name]
    (nvim.ex.vsplit name))

(defn cursor-line-pos []
  "Return the cursor's current line number"
  ; returns (row, column)
  (let [pos (nvim.win_get_cursor 0)]
    (. pos 1)))
 
(defn insert-lines [lines]
  (nvim.buf_set_lines 0 0 0 false lines))

;; https://github.com/lc9er/bran/blob/0dc42396215c4de3c72ed80d38f37f4fa0eed0b6/fnl/bran/main.fnl
(defn insert-current-pos [lines]
  (let [
        ;; pos (nvim.win_get_cursor 0)
        ;; pos (+ (cursor-line-pos) 1)
        pos (cursor-line-pos)
        ]
      (nvim.buf_set_lines 0 pos pos false lines)
    )
  )

 ;; (new-split "foo")  
(defn l-word []
  (let [cword (nvim.fn.expand "<cword>")
        ]
    (print 
     ;; (.. "console.log(\"" cowrd "\"," cword ")")
     ;; (.. "console.log(\""  cword "\"," cword ")")
     (.. "console.log(\""  cword "\"," cword ")")
     (cursor-line-pos)

  ;; (nvim.buf_line_count 0)
     ;; (insert-lines ["look"])
     (insert-current-pos [(.. "console.log(\""  cword "\"," cword ")")])
     ;; (insert-current-pos ["look"])

     ;; (nvim.win_get_cursor 0)
     ;; (type cword )
      )
    )
  )
(l-word)
