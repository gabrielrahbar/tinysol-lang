open Typechecker

let%test "state_var_visibility_test_1" = test_typecheck
  "contract C{
    uint external x;
  }"
false

let%test "state_var_visibility_test_2" = test_typecheck
  "contract C {
    int y;
    uint external x;
  }"
false

let%test "state_var_visibility_test_3" = test_typecheck
  "contract C {
     uint x;
     constructor() {x=1;}
  }"
true

let%test "state_var_visibility_test_4" = test_typecheck
  "contract C {
     uint internal x;
     uint public y;
     constructor() {
       x=1;
       y=2;
    }
  }"
true

let%test "state_var_visibility_test_5" = test_typecheck
  "contract C {
      int external x;
       bool external y;
  }"
false
