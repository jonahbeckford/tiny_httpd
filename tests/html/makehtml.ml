open Tiny_httpd_html
let spf = Printf.sprintf

let t1() =
  html [] [
    head [] [];
    body [] [
      ul [A.style "list-style: circle"] (
        li[][pre [] [txt "a"; pre[][txt "c"; txt"d"]; txt "b"]] ::
        List.init 100 (fun i -> li [A.id (spf "l%d" i)] [txt (spf "item %d" i)])
      )
    ]
  ]


let t2() =
  html [] [
    head [] [];
    pre [] [txt "a"; txt "b"];
    body [] [
      ul' [A.style "list-style: circle"] [
        sub_l @@ List.init 100 @@ fun i ->
        li ~if_:(i<> 42) [A.id (spf "l%d" i)] [txt (spf "item %d" i)]
      ]
    ]
  ]

let render t =
  print_endline @@ to_string_top @@ t

let () =
  match Sys.argv.(1) with
  | "1" -> render @@ t1()
  | "2" -> render @@ t2()
  | _ -> failwith "unknown cmd"