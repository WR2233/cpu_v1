let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (CommonExp.f (Inline.f (Assoc.f (Beta.f e))))) in
  if e = e' then e else
  iter (n - 1) e'

(*中間結果出力用のチャンネルも受け取るようにした*)
(*parse, knormal はチャンネルのOption型*)
let lexbuf _ parse knormal optim closure l = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  let parse_res = MyParser.exp MyLexer.token l in
  let _ = match parse with
  | Some(f) -> (Syntax.display_t f parse_res)
  | None -> () in
  let knormal_res = KNormal.f (Typing.f parse_res) in
  let _ = match knormal with
  | Some(f) -> (KNormal.display_t f knormal_res)
  | None -> () in
  let opt_res = iter !limit (Alpha.f knormal_res) in
  let _ = match optim with
  | Some(f) -> (KNormal.display_t f opt_res)
  | None -> () in
  let cls_res = Closure.f opt_res in
  let _ = match closure with
  | Some(f) -> (Closure.output_prog f cls_res)
  | None -> () in ()

let string s = lexbuf stdout None None None None (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  let parsechan = open_out (f ^ ".parsed") in
  let knormalchan = open_out (f ^ ".before_CSE") in
  let optchan = open_out (f ^ ".after_CSE") in
  let clschan = open_out (f ^ ".closure") in
  try
    lexbuf outchan (Some parsechan) (Some knormalchan) (Some optchan) (Some clschan) (Lexing.from_channel inchan);
    close_in inchan;
    close_out outchan;
    close_out parsechan;
    close_out knormalchan;
    close_out optchan;
  with e -> (close_in inchan; close_out outchan; raise e)

let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
