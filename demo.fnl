
(module demo
{autoload {
           nvim aniseed.nvim
          {: assoc : update} aniseed.core
           }}
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
;; (l-word)
;; nvim api https://neovim.io/doc/user/api.html test
;;

(defn +docs [opts to]
  (update opts :desc (fn [desc] (or desc to))))

(defn kset [modes from to opts]
  (let [opts  (if 
                (= (type opts) "table")  opts
                (= (type opts) "string") {:desc opts})]
    (vim.keymap.set modes from to (+docs opts to))))


(defn replace-selection []
  (let [[sr sc] (vim.api.nvim_buf_get_mark 0 "<")
        ;; [sr sc] [(dec sr) sc]
        [er ec] (vim.api.nvim_buf_get_mark 0 ">")
        ]
    (print 
      sr sc er ec
      )
    )
  )

;; 字符处理

;; (vim.api.nvim_create_user_command
;;   :ReplaceSelection replace-selection
;;   {:nargs 1 :desc "Replace selected word with result function"})

;; (vim.api.nvim_create_user_command
;;   :ReplaceSelection replace-selection
;;   {:nargs 1 :desc "Replace selected word with result function"})


(vim.api.nvim_create_user_command
  "JsRangeAddDot" 
  (fn repdot []
    (vim.cmd "normal gv")
    (vim.cmd ":'<,'>s/\\([^?]\\)\\./\\1?.")
    ;; (vim.cmd "<cmd> s/\\([^?]\\)\\./\\1?.")
    ;; (vim.command ":'<,'>s/\([^?]\)./\1?.")
    ) 
{:bang true
                                     :desc "range . to ?."}
  )

;; "'<,'>s/\([^?]\)./\1?."

;; "'<,'>s/\([^?]\)./\1?."

;; (kset :x  :o "RepDot")
;; asdasd?.sda
;; (kset :x  :o  ":'<,'>s/\([^?]\)./\1?.")

;; visual line will auto add  `'<,'>s`
;; (kset :x  :o  ":s/\\([^?]\\)\\./\\1?.")
;; (kset :x  :o  "<Cr> | :normal gv<Cr>")
;; (kset :x  :o  ":normal gv | '<,'>s/\\([^?]\\)\\./\\1?.")
;; (kset :x  :o  "gv <cmd> '<,'>s/\\([^?]\\)\\./\\1?.")



;;bsdas?.sd
;; asdasd?.sda
;; asdasd.sda
;; asdasd.sda
;; asdasd.sda
