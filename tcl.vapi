[CCode (cprefix = "Tcl_", cheader_filename = "tcl.h")]
namespace Tcl
{
    /*
     * define tcl constants
     */
    [CCode (cname = "TCL_OK")]
    public const int OK;

    [CCode (cname = "TCL_ERROR")]
    public const int ERROR;

    [CCode (cname = "TCL_RETURN")]
    public const int RETURN;

    [CCode (cname = "TCL_BREAK")]
    public const int BREAK;

    [CCode (cname = "TCL_CONTINUE")]
    public const int CONTINUE;

    /*
     * define standard tcl results
     */

    [CCode (cname = "int", cprefix = "TCL_", has_type_id = false)]
    public enum Result {
        OK,
        ERROR,
        RETURN,
        BREAK,
        CONTINUE
    }

    /*
     * define standard tcl link types
     */

    [CCode (cname = "int", cprefix = "TCL_LINK_", has_type_id = false)]
    public enum Link {
        INT,
        DOUBLE,
        BOOLEAN,
        STRING,
        WIDE_INT,
        CHAR,
        UCHAR,
        SHORT,
        USHORT,
        UINT,
        LONG,
        ULONG,
        FLOAT,
        WIDE_UINT,
        READ_ONLY
    }

    /*
     * define delegate types
     */

    [CCode (cname = "Tcl_FreeInternalRepProc", has_target = false)]
    public delegate void FreeInternalRepProc (Tcl.Object object);

    [CCode (cname = "Tcl_DupInternalRepProc", has_target = false)]
    public delegate void DuplicateInternalRepProc (Tcl.Object src, Tcl.Object dup);

    [CCode (cname = "Tcl_UpdateStringProc", has_target = false)]
    public delegate void UpdateStringProc (Tcl.Object object);

    [CCode (cname = "Tcl_SetFromAnyProc", has_target = false)]
    public delegate int SetFromAnyProc (Tcl.Interp interp, Tcl.Object object);

    [CCode (cname = "Tcl_NamespaceDeleteProc", instance_pos = 0.5)]
    public delegate void NamespaceDeleteProc ();

    [CCode (cname = "Tcl_CmdProc", instance_pos = 0.5)]
    public delegate int CommandProc (Tcl.Interp interp, [CCode (array_length_cname = "argc", array_length_pos = 1.1)] string[] argv);

    [CCode (cname = "CompileProc", cheader_filename = "tclInt.h", has_target = false)]
    public delegate int CompileProc (Tcl.Interp interp, Tcl.Parse parse, Tcl.Command cmd, Tcl.CompileEnv comp_env);

    [CCode (cname = "Tcl_ObjCmdProc", instance_pos = 0.5)]
    public delegate int ObjectCommandProc (Tcl.Interp interp, [CCode (array_length_pos = 1.1)] Tcl.Object[] objects);

    [CCode (cname = "Tcl_CmdDeleteProc", instance_pos = 0.5)]
    public delegate void CommandDeleteProc ();

    [CCode (cname = "Tcl_CommandTraceProc", instance_pos = 0.5)]
    public delegate void CommandTraceProc (Tcl.Interp interp, string old_name, string new_name, int flags);

    [CCode (cname = "Tcl_HashKeyProc", has_target = false)]
    public delegate int HashKeyProc (Tcl.HashTable table, void *key);

    [CCode (cname = "Tcl_CompareHashKeysProc", has_target = false)]
    public delegate int CompareHashKeysProc (void *key, Tcl.HashEntry h);

    [CCode (cname = "Tcl_AllocHashEntryProc", has_target = false)]
    public delegate Tcl.HashEntry AllocHashEntryProc (Tcl.HashTable table, void *key);

    [CCode (cname = "Tcl_FreeHashEntryProc", has_target = false)]
    public delegate void FreeHashEntryProc (Tcl.HashEntry h);


    [CCode (cname = "Tcl_ObjType", has_type_id = false)]
    public struct ObjectType {
        [CCode (cname = "name")]
        string name;

        [CCode (cname = "freeIntRepProc")]
        FreeInternalRepProc free_int_rep_proc;

        [CCode (cname = "dupIntRepProc")]
        DuplicateInternalRepProc duplicate_internal_rep_proc;

        [CCode (cname = "updateStringProc")]
        UpdateStringProc update_string_proc;

        [CCode (cname = "setFromAnyProc")]
        SetFromAnyProc set_from_any_proc;
    }

    [CCode (cname = "ptrAndLongRep", has_type_id = false)]
    public struct PtrAndLongRep {
        void *ptr;
        ulong value;
    }

    [CCode (cname = "twoPtrValue", has_type_id = false)]
    public struct TwoPtrValue {
        void *ptr1;
        void *ptr2;
    }

    [SimpleType]
    [CCode (cname = "Tcl_WideInt", has_type_id = false)]
    public struct WideInt : int64 {}

    [SimpleType]
    [CCode (cname = "ClientData", has_type_id = false)]
    public struct ClientData : int {}

    [CCode (cname = "CompileEnv", has_type_id = false)]
    public struct CompileEnv {}

    [CCode (cname = "internalRep", has_type_id = false)]
    public struct InternalRep {
        [CCode (cname = "longValue")]
        long long_value;

        [CCode (cname = "doubleValue")]
        double double_value;

        [CCode (cname = "otherValuePtr")]
        void *other_value;

        [CCode (cname = "wideValue")]
        WideInt wide_value;

        [CCode (cname = "twoPtrValue")]
        TwoPtrValue two_values;

        [CCode (cname = "ptrAndLongRep")]
        PtrAndLongRep ptr_and_long_rep;
    }

    //[CCode (cname = "Tcl_Obj", ref_function = "Tcl_IncrRefCount", unref_function = "Tcl_DecrRefCount", copy_function = "Tcl_DuplicateObj", has_type_id = false)]
    [CCode (cname = "Tcl_Obj", cheader_filename = "tclHacks.h", ref_function = "Tcl_IncrRefCount", unref_function = "Tcl_LessInsaneDecrRefCount", copy_function = "Tcl_DuplicateObj", has_type_id = false)]
    public class Object {
        [CCode (cname = "refCount")]
        public int ref_count;

        [CCode (cname = "bytes")]
        private uint8[] bytes;

        [CCode (cname = "length")]
        private int _length;

        public int length {
            get { return this._length; }
            [CCode (cname = "Tcl_SetObjLength")] set;
        }

        [CCode (cname = "typePtr")]
        private Tcl.ObjectType type;

        [CCode (cname = "internalRep")]
        private Tcl.InternalRep internal_rep;

        /*  contructor */
        [CCode (cname = "Tcl_NewObj")]
        public Object ();

        [CCode (cname = "Tcl_NewBooleanObj")]
        public Object.from_boolean (bool bool_value);

        [CCode (cname = "Tcl_NewByteArrayObj")]
        public Object.from_byte_array ([CCode (array_length_cname = "length", array_length_pos = 2.1)] uint8[] bytes);

        [CCode (cname = "Tcl_NewDoubleObj")]
        public Object.from_double (double double_value);

        [CCode (cname = "Tcl_NewIntObj")]
        public Object.from_int (int int_value);

        [CCode (cname = "Tcl_NewListObj")]
        public Object.from_list ([CCode (array_length_cname = "objc", array_length_pos = 1.1)] Tcl.Object[] objv);

        [CCode (cname = "Tcl_NewLongObj")]
        public Object.from_long (long long_value);

        [CCode (cname = "Tcl_NewStringObj")]
        public Object.from_string (string bytes, int length = -1);

        [CCode (cname = "Tcl_ConcatObj")]
        public Object.from_objects_concatenation ([CCode (array_length_cname = "objc", array_length_pos = 1.1)] Tcl.Object[] objv);

        /* end constructors */

        [CCode (cname = "Tcl_SetBooleanObj")]
        public void set_boolean (bool bool_value);

        [CCode (cname = "Tcl_SetByteArrayLength")]
        public uint8 set_byte_array_length (int length);

        [CCode (cname = "Tcl_SetByteArrayObj")]
        public void set_byte_array ([CCode (array_length_cname = "length", array_length_pos = 2.1)] uint8[] bytes);

        [CCode (cname = "Tcl_SetDoubleObj")]
        public void set_double (double double_value);

        [CCode (cname = "Tcl_SetIntObj")]
        public void set_int (int int_value);

        [CCode (cname = "Tcl_SetListObj")]
        public void set_list ([CCode (array_length_cname = "objc", array_length_pos = 1.1)] Tcl.Object[] objv);

        [CCode (cname = "Tcl_SetLongObj")]
        public void set_long (long long_value);

        [CCode (cname = "Tcl_SetObjLength")]
        public void set_length (int length);

        [CCode (cname = "Tcl_SetStringObj")]
        public void set_string (string bytes, int length = -1);

        [CCode(cname = "Tcl_IncrRefCount")]
        public void @ref ();

        //[CCode(cname = "Tcl_DecrRefCount")]
        [CCode(cname = "Tcl_LessInsaneDecrRefCount", cheader_filename = "tclHacks.h")]
        public void unref ();

        [CCode(cname = "Tcl_DuplicateObj")]
        public Tcl.Object copy ();

        [CCode (cname = "Tcl_IsShared")]
        public int is_shared ();

        [CCode (cname = "TclFreeObj")]
        public void free ();

        [CCode (cname = "Tcl_GetString")]
        public unowned string get_string ();

        [CCode (cname = "Tcl_GetStringFromObj")]
        public unowned string get_string_from_object (int length);

        [CCode (cname = "Tcl_AppendStringsToObj")]
        public void append_strings (...);

        [CCode (cname = "Tcl_AppendToObj")]
        public void append_string (string bytes, int length = -1);
    }

    [CCode (cname = "ImportRef", has_type_id = false)]
    public class ImportReference {
        [CCode (cname = "importedCmdPtr")]
        Tcl.Command command;

        [CCode (cname = "nextPtr")]
        Tcl.ImportReference next;
    }

    [CCode (cname = "CommandTrace", has_type_id = false)]
    public class CommandTrace {

        [CCode (cname = "traceProc")]
        Tcl.CommandTraceProc trace_proc;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "flags")]
        int flags;

        [CCode (cname = "nextPtr")]
        Tcl.CommandTrace next;

        [CCode (cname = "refCount")]
        int ref_count;
    }

    [CCode (cname = "Tcl_HashKeyType", has_type_id = false)]
    public struct HashKeyType {
        [CCode (cname = "version")]
        int version;

        [CCode (cname = "flags")]
        int flags;

        [CCode (cname = "hashKeyProc")]
        Tcl.HashKeyProc hash_key_proc;

        [CCode (cname = "compareKeysProc")]
        Tcl.CompareHashKeysProc compare_keys_proc;

        [CCode (cname = "allocEntryProc")]
        Tcl.AllocHashEntryProc alloc_entry_proc;

        [CCode (cname = "freeEntryProc")]
        Tcl.FreeHashEntryProc free_entry_proc;
    }

    [CCode (cname = "key", has_type_id = false)]
    public struct Key {
        [CCode (cname = "oneWordValue")]
        string word;

        [CCode (cname = "objPtr")]
        Tcl.Object object;

        [CCode (cname = "words")]
        int words;

        [CCode (cname = "string")]
        string string;
    }

    [CCode (cname = "Tcl_HashEntry", free_function = "Tcl_DeleteHashEntry", has_type_id = false)]
    public class HashEntry {
        [CCode (cname = "nextPtr")]
        Tcl.HashEntry? next;

        [CCode (cname = "tablePtr")]
        Tcl.HashTable table;

        [CCode (cname = "hash")]
        void *hash;

        [CCode (cname = "bucketPtr")]
        Tcl.HashEntry bucket;

        [CCode (cname = "key")]
        Tcl.Key key;

        [CCode (cname = "Tcl_CreateHashEntry")]
        HashEntry (int new_ptr) {
            table.create (this.key.word, new_ptr);
        }

        [CCode (cname = "Tcl_DeleteHashEntry")]
        public void delete ();
    }

    [CCode (cname = "Tcl_HashTable", free_function = "Tcl_DeleteHashTable", has_type_id = false)]
    public class HashTable {

        [CCode (cname = "buckets", array_length_cname = "numBuckets")]
        Tcl.HashEntry[] buckets;

        [CCode (cname = "staticBuckets")]
        Tcl.HashEntry static_buckets[4];

        [CCode (cname = "numBuckets")]
        int num_buckets;

        [CCode (cname = "numEntries")]
        int num_entries;

        [CCode (cname = "rebuildSize")]
        int rebuild_size;

        [CCode (cname = "downShift")]
        int down_shift;

        [CCode (cname = "mask")]
        int mask;

        [CCode (cname = "keyType")]
        int key_type;

        [CCode (cname = "findProc")]
        public Tcl.HashEntry find (string key);

        [CCode (cname = "createProc")]
        public Tcl.HashEntry create (string key, int new_ptr);

        [CCode (cname = "typePtr")]
        Tcl.HashKeyType type;

        [CCode (cname = "Tcl_DeleteHashTable")]
        public void delete ();
    }

    [Compact]
    [CCode (cname = "struct Command", free_function = "", cheader_filename = "tclInt.h", has_type_id = false)]
    public class Command {
        [CCode (cname = "hPtr", ctype = "Tcl_HashEntry")]
        Tcl.HashEntry hash;

        [CCode (cname = "nsPtr")]
        Tcl.Namespace ns;

        [CCode (cname = "refCount")]
        int ref_count;

        [CCode (cname = "cmdEpoch")]
        int cmd_epoch;

        [CCode (cname = "compileProc")]
        Tcl.CompileProc compile_proc;

        [CCode (cname = "objProc")]
        Tcl.ObjectCommandProc object_command_proc;

        [CCode (cname = "objClientData")]
        Tcl.ClientData object_client_data;

        [CCode (cname = "proc")]
        Tcl.CommandProc command_proc;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "deleteProc")]
        Tcl.CommandDeleteProc command_delete_proc;

        [CCode (cname = "deleteData")]
        Tcl.ClientData delete_data;

        [CCode (cname = "flags")]
        int flags;

        [CCode (cname = "importRefPtr")]
        Tcl.ImportReference import_reference;

        [CCode (cname = "tracePtr")]
        Tcl.CommandTrace command_trace;
    }

    [CCode (cname = "Tcl_Token", has_type_id = false)]
    public struct Token {
        [CCode (cname = "type")]
        int type;

        [CCode (cname = "start")]
        string start;

        [CCode (cname = "size")]
        int size;

        [CCode (cname = "numComponents")]
        int num_components;
    }

    [CCode (cname = "Tcl_Parse", has_type_id = false)]
    public struct Parse {

        [CCode (cname = "commentStart")]
        string comment_start;

        [CCode (cname = "commentSize")]
        int comment_size;

        [CCode (cname = "commandStart")]
        string command_start;

        [CCode (cname = "commandSize")]
        int command_size;

        [CCode (cname = "numWords")]
        int num_words;

        [CCode (cname = "tokenPtr")]
        Tcl.Token[] token;

        [CCode (cname = "numTokens")]
        int num_tokens;

        [CCode (cname = "tokensAvailable")]
        int tokens_available;

        [CCode (cname = "errorType")]
        int error_type;

        [CCode (cname = "string")]
        string string;

        [CCode (cname = "end")]
        string end;

        [CCode (cname = "interp")]
        Tcl.Interp interp;

        [CCode (cname = "term")]
        string term;

        [CCode (cname = "incomplete")]
        int incomplete;

        [CCode (cname = "staticTokens")]
        Tcl.Token[] static_tokens[20];
    }

    [CCode (cname = "Tcl_Namespace", free_function = "Tcl_NamespaceDeleteProc", has_type_id = false)]
    public class Namespace {
        [CCode (cname = "name")]
        string name;

        [CCode (cname = "fullName")]
        string full_name;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "deleteProc")]
        Tcl.NamespaceDeleteProc delete_proc;

        [CCode (cname = "parentPtr")]
        Tcl.Namespace parent;
    }

    [Compact]
    [CCode (cname = "Tcl_Interp", free_function = "Tcl_DeleteInterp", has_type_id = false)]
    public class Interp {
        [CCode (cname = "result")]
        public string result {
            get {
                return (string) this._result;
            }
            set {
                this.free_result ();
                this._result = value.dup ();
                this.free_proc = GLib.g_free;
            }
        }

        [CCode (cname = "result")]
        private void* _result;

        [CCode (cname = "freeProc")]
        public GLib.DestroyNotify free_proc;

        [CCode (cname = "errorLine")]
        public int error_line;

        [CCode (cname = "Tcl_CreateInterp")]
        public Interp ();

        [CCode (cname = "Tcl_Init")]
        public Tcl.Result init ();

        [CCode (cname = "Tcl_Eval")]
        public Tcl.Result eval (string script);

        [CCode (cname = "Tcl_EvalEx")]
        public Tcl.Result eval_ex (string script, int num_bytes, int flags);

        [CCode (cname = "Tcl_VarEval")]
        public Tcl.Result var_eval (...);

        [CCode (cname = "Tcl_GlobalEval")]
        public Tcl.Result global_eval (string script);

        [CCode (cname = "Tcl_EvalFile")]
        public Tcl.Result eval_file (string file_name);

        [CCode (cname = "Tcl_VarEvalVA")]
        public Tcl.Result var_eval_va (va_list arg_list);

        [CCode (cname = "Tcl_GetBoolean")]
        public Tcl.Result get_boolean (string src, int ptr);

        [CCode (cname = "Tcl_GetDouble")]
        public Tcl.Result get_double (string src, double ptr);

        [CCode (cname = "Tcl_GetInt")]
        public Tcl.Result get_int (string src, int ptr);

        [CCode (cname = "Tcl_AddErrorInfo")]
        public void add_error_info (string message);

        [CCode (cname = "Tcl_AddObjErrorInfo")]
        public void add_object_error_info (string message, int length);

        [CCode (cname = "Tcl_AllowExceptions")]
        public void allow_exceptions ();

        [CCode (cname = "Tcl_AppendElement")]
        public void append_element (string element);

        [CCode (cname = "Tcl_AppendResult")]
        public void append_result (...);

        [CCode (cname = "Tcl_AsyncInvoke")]
        public Tcl.Result async_invoke (int code);

        [CCode (cname = "Tcl_GetStringResult")]
        public unowned string get_string_result ();

        [CCode (cname = "Tcl_GetVar")]
        public unowned string get_var (string variable_name, int flags);

        [CCode (cname = "Tcl_GetVar2")]
        public unowned string get_var2 (string part1, string part2, int flags);

        [CCode (cname = "Tcl_BackgroundError")]
        public void background_error ();

        [CCode (cname = "Tcl_BadChannelOption")]
        public Tcl.Result bad_channel_option (string option_name, string[] option_list);

        [CCode (cname = "Tcl_CreateSlave")]
        public Tcl.Interp create_slave(string slave_name, int is_safe);

        [CCode (cname = "Tcl_DeleteAssocData")]
        public void delete_assoc_data (string name);

        [CCode (cname = "Tcl_CreateCommand")]
        public Tcl.Command create_command (string command_name, owned Tcl.CommandProc proc);

        [CCode (cname = "Tcl_DeleteCommand")]
        public Tcl.Result delete_command (string command_name);

        [CCode (cname = "Tcl_HideCommand")]
        public Tcl.Result hide_command (string command_name, string hidden_command_token);

        [CCode (cname = "Tcl_DeleteInterp")]
        public void delete ();

        [CCode (cname = "Tcl_InterpDeleted")]
        public int is_deleted ();

        [CCode (cname = "Tcl_IsSafe")]
        public int is_safe ();

        [CCode (cname = "Tcl_ExposeCommand")]
        public Tcl.Result expose_command(string hidden_command_token, string command_name);

        [CCode (cname = "Tcl_ExprBoolean")]
        public Tcl.Result expr_boolean (string expr, int ptr);

        [CCode (cname = "Tcl_ExprDouble")]
        public Tcl.Result expr_double (string expr, int ptr);

        [CCode (cname = "Tcl_ExprLong")]
        public Tcl.Result expr_long (string expr, int ptr);

        [CCode (cname = "Tcl_ExprString")]
        public Tcl.Result expr_string (string expr);

        [CCode (cname = "Tcl_FreeResult")]
        public void free_result ();

        [CCode (cname = "Tcl_GetInterpPath")]
        public Tcl.Result get_slave_path (Tcl.Interp slave);

        [CCode (cname = "Tcl_GetMaster")]
        public Tcl.Interp get_master ();

        [CCode (cname = "Tcl_GetSlave")]
        public Tcl.Interp get_slave (string slave_name);

        [CCode (cname = "Tcl_CreateAlias")]
        public Tcl.Result create_alias (string command_name, Tcl.Interp target_interp, string target_command_name, [CCode (array_length_cname = "argc", array_length_pos = 3.1)] string[] argv);

        [CCode (cname = "Tcl_GetAlias")]
        public Tcl.Result get_alias (string command_name, Tcl.Interp target_interp, string target_command_name, [CCode (array_length_cname = "argc", array_length_pos = 3.1)] string[] argv);

        [CCode (cname = "Tcl_CreateAliasObj")]
        public Tcl.Result create_alias_object (string command_name, Tcl.Interp target_interp, string target_command_name, [CCode (array_length_cname = "objc", array_length_pos = 3.1)] Tcl.Object[] objv);

        [CCode (cname = "Tcl_LinkVar")]
        public Tcl.Result link_variable (string variable_name, string address, Tcl.Link link_type);

        [CCode (cname = "Tcl_UnlinkVar")]
        public Tcl.Result unlink_variable (string variable_name, string address);

        [CCode (cname = "Tcl_UpdateLinkedVar")]
        public Tcl.Result update_linked_variable (string variable_name);

        [CCode (cname = "Tcl_MakeSafe")]
        public Tcl.Result make_safe ();

        [CCode (cname = "Tcl_PrintDouble")]
        public void print_double (double value, string dst);

        [CCode (cname = "Tcl_PosixError")]
        public unowned string posix_error ();

        [CCode (cname = "Tcl_WrongNumArgs")]
        public void wrong_number_args ([CCode (array_length_cname = "objc", array_length_pos = 1.1)] Tcl.Object[] objv, string message);
    }

    [CCode (cname = "Tcl_FindExecutable")]
    public void find_executable (string argv0);

    [CCode (cname = "Tcl_GetNameOfExecutable")]
    public unowned string get_name_of_executable ();

    [CCode (cname = "Tcl_CommandComplete")]
    public bool is_command_complete (string cmd);

    [CCode (cname = "Tcl_GetVersion")]
    public void get_version (int *major, int *minor, int *patch_level, int *type);

    [CCode (cname = "Tcl_Finalize")]
    public void finalize ();

    [CCode (cname = "Tcl_FinalizeThread")]
    public void finalize_thread ();

    [CCode (cname = "Tcl_ReapDetachedProcs")]
    public void reap_detached_procs ();

    [CCode (cname = "Tcl_GetHostName")]
    public unowned string get_hostname ();

    [CCode (cname = "Tcl_GetServiceMode")]
    public int get_service_mode ();

    [CCode (cname = "Tcl_ServiceAll")]
    public int service_all ();

    [CCode (cname = "Tcl_Exit")]
    public void exit (int status);

    [CCode (cname = "Tcl_Concat")]
    public string concatenate ([CCode (array_length_cname = "argc", array_length_pos = 0.9)] string[] argv);

    [CCode (cname = "Tcl_ConcatObj")]
    public Tcl.Object concatenate_object ([CCode (array_length_cname = "objc", array_length_pos = 0.9)] Tcl.Object[] objv);


}
