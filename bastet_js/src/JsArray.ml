(** This module provdes [Js.Array]-sepcific implementations for those who want things to compile into
    clean javascript code. You can still use {!Array} on the JS side if this doesn't matter to you. *)

open Bastet

module A = ArrayF.Make (struct
  let length = Js.Array.length

  let make n value =
    let arr = [||] in
    for _ = 1 to n do
      Js.Array.push ~value arr |> ignore
    done;
    arr

  let append other a = Js.Array.concat ~other a
  let map f a = Js.Array.map ~f a
  let mapi f a = Js.Array.mapi ~f a
  let fold_left f a b = Js.Array.reduce ~f ~init:a b
  let every f a = Js.Array.every ~f a
  let slice ~start ~end_ a = Js.Array.slice ~start ~end_ a
end)

include A
