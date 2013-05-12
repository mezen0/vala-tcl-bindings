using Tcl;

class Test : GLib.Object {

    public static int get_max (Tcl.Interp interp, string[] args) {
        stdout.printf ("argc %i, args : %s, %s, %s\n", args.length, args[0], args[1], args[2]);
        stdout.printf ("TCL_OK    = %i\n", Tcl.OK);
        stdout.printf ("TCL_ERROR = %i\n", Tcl.ERROR);
        if (args.length == 3) {
            int a = int.parse (args[1]);
            int b = int.parse (args[2]);
            interp.result = int.max (a, b).to_string();
            return Tcl.Result.OK;
        } else {
            interp.result = "Wrong # args: must be 2 integer values" ;
            return Tcl.Result.ERROR;
        }
    }

    public static int main (string[] args) {

        Tcl.find_executable (args[0]);
        stdout.printf ("Name of executable : %s\n", Tcl.get_name_of_executable ());

        Tcl.Interp interp = new Tcl.Interp ();
        interp.create_command ("get_max", get_max);
        Tcl.Object obj = new Tcl.Object ();
        obj.set_string ("ABC");
        obj.set_int (2);
        obj.set_boolean (true);
        obj.append_string ("  test");
        stdout.printf ("string object : %s\n", obj.get_string ());

        Tcl.Namespace ns = new Tcl.Namespace (interp, "NS");
        Tcl.Namespace ns2 = interp.create_namespace ("NS2");
        int res = ns.export (interp, "A", true);
        stdout.printf ("res: %i\n", res);

        int init = interp.init ();

        if (init == Tcl.Result.OK) {
            string script = """
                #package require Tk

                proc hello { } {
                    puts "Hello world"
                }
                hello

                set a [get_max 10 15]
                puts "a is $a"

                for {set list {}} {[llength $list]<6} {} {
                    lappend list [expr int(49*rand())+1]
                    set list [lsort -unique $list]
                }
                puts $list

                #button .b -text "Ok" -command { puts "Hello" }
                #pack .b

                #vwait forever
            """;

            interp.eval (script);
        }
        return 0;
    }
}
