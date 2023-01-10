;; todo right <=> left
(module init
  {autoload {nvim aniseed.nvim}}
  )

;; (require :core)
;; (require :fennec-settings)
;; (require :mapping)
;; (require :plugin)


;; (lambda shared-command! [api-function name command ?options]
;;   (assert-compile (sym? api-function) "expected symbol for api-function" api-function)
;;   (assert-compile (sym? name) "expected symbol for name" name)
;;   (assert-compile (or (str? command) (sym? command) (fn? command) (quoted? command)) "expected string, symbol, function or quoted expression for command" command)
;;   (assert-compile (or (nil? ?options) (table? ?options)) "expected table for options" ?options)
;;   (let [name (->str name)
;;         options (or ?options {})
;;         options (if (nil? options.desc)
;;                   (doto options (tset :desc (if (quoted? command) (quoted->str command)
;;                                               (str? command) command
;;                                               (view command))))
;;                   options)
;;         command (if (quoted? command) (quoted->fn command) command)]
;;     `(,api-function ,name ,command ,options)))
;;
;; (lambda command! [name command ?options]
;;   "Create a new user command using the vim.api.nvim_create_user_command API.
;;   Accepts the following arguments:
;;   name -> must be a symbol.
;;   command -> can be an string, a symbol, a function or a quoted expression.
;;   options -> a table of options. Optional. If the :desc option is not specified
;;              it will be inferred.
;;   Example of use:
;;   ```fennel
;;   (command! Salute '(print \"Hello World\")
;;             {:bang true :desc \"This is a description\"})
;;   ```
;;   That compiles to:
;;   ```fennel
;;   (vim.api.nvim_create_user_command \"Salute\" (fn [] (print \"Hello World\"))
;;                                     {:bang true
;;                                      :desc \"This is a description\"})
;;   ```"
;;   (shared-command! 'vim.api.nvim_create_user_command name command ?options))
;;


(vim.api.nvim_create_user_command "Salute" (fn [] (print "Hello World"))
                                    {:bang true
                                     :desc "This is a description"})

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
;; (defn  log []
;;   (let [cword (nvim.fn.expand "<cword>")
;;         ]
;;     ;;(print 
;;      ;; (.. "console.log(\"" cowrd "\"," cword ")")
;;      ;; (.. "console.log(\""  cword "\"," cword ")")
;;      (.. "console.log(\""  cword "\"," cword ")")
;;      (cursor-line-pos)
;;
;;   ;; (nvim.buf_line_count 0)
;;      ;; (insert-lines ["look"])
;;      (insert-current-pos [(.. "console.log(\""  cword "\"," cword ")")])
;;      ;; (insert-current-pos ["look"])
;;
;;      ;; (nvim.win_get_cursor 0)
;;      ;; (type cword )
;;      ;; )
;;     )
;;   )

(vim.api.nvim_create_user_command "Log" 
                                  
(fn  log []
  (let [cword (nvim.fn.expand "<cword>")
        ]
    ;;(print 
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
     ;; )
    )
  )
                                    {:bang true
                                     :desc "JS insert  log var "})

(fn get-cursor-pos [] [(vim.fn.line ".") (vim.fn.col ".")])


(vim.api.nvim_create_user_command
  "JsRangeAddDot" 
  (fn repdot []
    (vim.cmd "normal gv")
    (vim.cmd ":'<,'>s/\\([^?]\\)\\./\\1?./g")
    ;;(vim.cmd ":'<,'>s/\\([^?|\\.|\\d]\\)\\./\\1?.")
    ;; (vim.cmd "<cmd> s/\\([^?]\\)\\./\\1?.")
    ;; (vim.command ":'<,'>s/\([^?]\)./\1?.")
    ) 
{:bang true
                                     :desc "range . to ?."}
  )

;; https://github.com/hpointu/mlt.nvim/blob/d7360990051bd9442652773d111221c2b7288101/fnl/more-like-that/main.fnl
(defn read-word []
  "Return the word under the cursor"
  (nvim.fn.expand "<cword>"))

(vim.api.nvim_create_user_command
  "ToggleWord" 
  (fn iepdot []
    (let [
          cword (nvim.fn.expand "<cword>")
          ]
       (if  (= cword "true")
            (nvim.command (.. "normal ciw" "false"))
            (= cword "false")
            (nvim.command (.. "normal ciw" "true"))
         ;; (vim.cmd "false")
         )
    ;; (vim.cmd "normal gv")
    ;; (vim.cmd ":'<,'>s/\\([^?]\\)\\./\\1?.")
    ;; (vim.cmd "<cmd> s/\\([^?]\\)\\./\\1?.")
    ;; (vim.command ":'<,'>s/\([^?]\)./\1?.")
    ) 

  )
{:bang true
                                     :desc "flip word"}
)
;; 0.8 ... doc_setting[0]


(vim.api.nvim_create_user_command
  "Brea" 
  (fn bre []
    (let [
          ]
    (vim.cmd ": s/\\( str\\|:str\\|class\\|:class\\|style\\|:style\\|@click\\|\\> \\)/\\r\\1/g")
    ;; (vim.cmd ":'<,'>s/\\([^?]\\)\\./\\1?.")
    ;; (vim.cmd "<cmd> s/\\([^?]\\)\\./\\1?.")
    ;; (vim.command ":'<,'>s/\([^?]\)./\1?.")
    ) 

  )
{:bang true
                                     :desc "range . to ?."}
)

;; asd?.sad false

;; <input style @click class='tr' @blur="checkName" v-model="form.pat_name" placeholder="请输入收件人姓名" />

(let [x (math.random 64)]
  (if (= 0 (% x 2))
      ;; (print "even" x)
      (print x)
      (= 0 (% x 9))
      (print x)
      ;; (print "multiple of nine" x)
      (print  "I dunno, something else" x)
      ))
(vim.api.nvim_create_user_command
  "Local" 
  (fn bre []
    (let [
          ]
    (vim.cmd ":pwd ")
    ;; (vim.cmd ":'<,'>s/\\([^?]\\)\\./\\1?.")
    ;; (vim.cmd "<cmd> s/\\([^?]\\)\\./\\1?.")
    ;; (vim.command ":'<,'>s/\([^?]\)./\1?.")
    ) 

  )
{:bang true
                                     :desc "range . to ?."}
)
