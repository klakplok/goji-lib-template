(* Published under the WTF public license
   Binding (c) 2013 Benjamin Canou *)

open Goji

let dummy_package =
  register_package
    ~doc:"Dummy binding"
    ~version:"1.0"
    "dummy"

let alert_component =
  register_component
    ~license:Goji_license.wtfpl
    ~doc:"Very useless module for handling alert messages"
    dummy_package "Alert"
    [ def_type
        ~doc:"The type of alerts"
        "t" (abstract any) ;
      def_function "make"
        ~doc:"Build an alert from a string"
        [ curry_arg "str" (string @@ var "tmp")]
        (get (var "tmp"))
        (abbrv "t") ;
      def_function "display"
        ~doc:"Display an alert"
        [ curry_arg "alert" (abbrv "t" @@ arg 0) ]
        (call_method ~sto:(jsglobal "window") "alert")
        void ]
