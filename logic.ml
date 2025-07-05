(* OCamlLogicLab: Minimal Propositional Logic Verifier *)

(* Define Boolean expressions *)
type bool_expr =
  | True
  | False
  | Var of string
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr
  | Not of bool_expr
  | Implies of bool_expr * bool_expr

(* Type for variable assignments *)
type env = (string * bool) list

(* Evaluate a boolean expression under a given environment *)
let rec eval expr env =
  match expr with
  | True -> true
  | False -> false
  | Var x -> List.assoc x env
  | And (p, q) -> (eval p env) && (eval q env)
  | Or (p, q) -> (eval p env) || (eval q env)
  | Not p -> not (eval p env)
  | Implies (p, q) -> (not (eval p env)) || (eval q env)

(* Generate all possible truth assignments for a list of variables *)
let rec all_envs vars =
  match vars with
  | [] -> [ [] ]
  | v :: vs ->
    let rest = all_envs vs in
    List.map (fun e -> (v, true) :: e) rest @ List.map (fun e -> (v, false) :: e) rest

(* Check if a formula is a tautology, contradiction, or contingent *)
let classify_formula expr vars =
  let envs = all_envs vars in
  let results = List.map (fun env -> eval expr env) envs in
  if List.for_all (fun r -> r) results then "Tautology"
  else if List.for_all (fun r -> not r) results then "Contradiction"
  else "Contingent"

(* Examples *)
let formula1 = Or (Var "P", Not (Var "P"))      (* Law of Excluded Middle *)
let vars1 = ["P"]

let formula2 = And (Var "P", Not (Var "P"))     (* Contradiction *)
let vars2 = ["P"]

let formula3 = Implies (Var "P", Var "Q")        (* Contingent *)
let vars3 = ["P"; "Q"]

let () =
  let res1 = classify_formula formula1 vars1 in
  let res2 = classify_formula formula2 vars2 in
  let res3 = classify_formula formula3 vars3 in

  print_endline ("Formula 1: " ^ res1);
  print_endline ("Formula 2: " ^ res2);
  print_endline ("Formula 3: " ^ res3);