(* gsl-ocaml - OCaml interface to GSL                        *)
(* Copyright (©) 2002-2005 - Olivier Andrieu                *)
(* distributed under the terms of the GPL version 2         *)

(** Simulated Annealing *)

(** NB: This module is not interfaced to GSL, it is implemented in OCaml.
    It is quite simple in fact, so rather than using it you may want to copy
    the code and tweak the algorithm in your own program. *)

type params = {
  iters_fixed_T : int;   (** The number of iterations at each temperature *)
  step_size     : float; (** The maximum step size in the random walk *)
  k             : float; (** parameter of the Boltzmann distribution *)
  t_initial     : float; (** initial temperature *)
  mu_t          : float; (** cooling factor *)
  t_min         : float; (** minimum temperature *)
} 

val solve :
  Gsl_rng.t -> 'a ->
  energ_func:('a -> float) ->
  step_func:(Gsl_rng.t -> 'a -> float -> 'a) ->
  ?print_func:('a -> unit) -> 
  params -> 'a
