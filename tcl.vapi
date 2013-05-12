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

    [CCode (cname = "TCL_MAJOR_VERSION")]
    public const int MAJOR_VERSION;

    [CCode (cname = "TCL_MINOR_VERSION")]
    public const int MINOR_VERSION;

    [CCode (cname = "TCL_FINAL_RELEASE")]
    public const int FINAL_RELEASE;

    [CCode (cname = "TCL_RELEASE_LEVEL")]
    public const int RELEASE_LEVEL;

    [CCode (cname = "TCL_RELEASE_SERIAL")]
    public const int RELEASE_SERIAL;

    [CCode (cname = "TCL_ALPHA_RELEASE")]
    public const int ALPHA_RELEASE;

    [CCode (cname = "TCL_BETA_RELEASE")]
    public const int BETA_RELEASE;

    [CCode (cname = "TCL_VERSION")]
    public const string VERSION;

    [CCode (cname = "TCL_PATCH_LEVEL")]
    public const string PATCH_LEVEL;

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
     * define tcl translation types
     */
    [CCode (cname = "TclEolTranslation", cprefix = "TCL_TRANSLATE_", cheader_filename = "tclInt.h", has_type_id = false)]
    public enum Translate {
        AUTO,
        CR,
        LF,
        CRLF
    }

    /*
     * define tcl tokens types
     */
    [CCode (cname = "int", cprefix = "TCL_TOKEN_", has_type_id = false)]
    public enum TokenType {
        WORD,
        SIMPLE_WORD,
        TEXT,
        BS,
        COMMAND,
        VARIABLE,
        SUB_EXPR,
        OPERATOR,
        EXPAND_WORD
    }

    /*
     * define delegate types
     */

    [CCode (cname = "Tcl_FreeInternalRepProc", has_target = false)]
    public delegate void FreeInternalRepFunc (Tcl.Object object);

    [CCode (cname = "Tcl_DupInternalRepProc", has_target = false)]
    public delegate void DuplicateInternalRepFunc (Tcl.Object src, Tcl.Object dup);

    [CCode (cname = "Tcl_UpdateStringProc", has_target = false)]
    public delegate void UpdateStringFunc (Tcl.Object object);

    [CCode (cname = "Tcl_SetFromAnyProc", has_target = false)]
    public delegate int SetFromAnyFunc (Tcl.Interp interp, Tcl.Object object);

    [CCode (cname = "Tcl_NamespaceDeleteProc", instance_pos = 0.5)]
    public delegate void NamespaceDeleteFunc ();

    [CCode (cname = "Tcl_CmdProc", instance_pos = 0.5)]
    public delegate int CommandFunc (Tcl.Interp interp, [CCode (array_length_cname = "argc", array_length_pos = 1.1)] string[] argv);

    [CCode (cname = "CompileProc", cheader_filename = "tclInt.h", has_target = false)]
    public delegate int CompileFunc (Tcl.Interp interp, Tcl.Parse parse, Tcl.Command cmd, Tcl.CompileEnv comp_env);

    [CCode (cname = "Tcl_ObjCmdProc", instance_pos = 0.5)]
    public delegate int ObjectCommandFunc (Tcl.Interp interp, [CCode (array_length_pos = 1.1)] Tcl.Object[] objects);

    [CCode (cname = "Tcl_CmdDeleteProc", instance_pos = 0.5)]
    public delegate void CommandDeleteFunc ();

    [CCode (cname = "Tcl_CommandTraceProc", instance_pos = 0.5)]
    public delegate void CommandTraceFunc (Tcl.Interp interp, string old_name, string new_name, int flags);

    [CCode (cname = "Tcl_HashKeyProc", has_target = false)]
    public delegate int HashKeyFunc (Tcl.HashTable table, void *key);

    [CCode (cname = "Tcl_CompareHashKeysProc", has_target = false)]
    public delegate int CompareHashKeysFunc (void *key, Tcl.HashEntry h);

    [CCode (cname = "Tcl_AllocHashEntryProc", has_target = false)]
    public delegate Tcl.HashEntry AllocHashEntryFunc (Tcl.HashTable table, void *key);

    [CCode (cname = "Tcl_FreeHashEntryProc", has_target = false)]
    public delegate void FreeHashEntryFunc (Tcl.HashEntry h);

    [CCode (cname = "Tcl_TimerProc", instance_pos = 0.5)]
    public delegate void TimerFunc ();

    [CCode (cname = "Tcl_EncodingConvertProc", instance_pos = 0.5)]
    public delegate int EncodingConvertFunc (owned string src, int srcLen, int flags,
                                             Tcl.EncodingState state, string dst, int dstLen,
                                             int srcReadPtr, int dstWrotePtr, int dstCharsPtr);

    [CCode (cname = "Tcl_EncodingFreeProc", instance_pos = 0.5)]
    public delegate void EncodingFreeFunc ();

    [CCode (cname = "Tcl_CloseProc", instance_pos = 0.5)]
    public delegate void CloseFunc ();

    [CCode (cname = "Tcl_ChannelProc", instance_pos = 0.5)]
    public delegate void ChannelFunc (int mask);

    [CCode (cname = "Tcl_DriverCloseProc", instance_pos = 0.5)]
    public delegate int DriverCloseFunc (Tcl.Interp interp);

    [CCode (cname = "Tcl_DriverInputProc", instance_pos = 0.5)]
    public delegate int DriverInputFunc (string buffer, int to_read, out int error_code);


    [CCode (cname = "Tcl_DriverOutputProc", instance_pos = 0.5)]
    public delegate int DriverOutputFunc (string buffer, int to_write, out int error_code);

    [CCode (cname = "Tcl_DriverSeekProc", instance_pos = 0.5)]
    public delegate int DriverSeekFunc (long offset, int mode, out int error_code);

    [CCode (cname = "Tcl_DriverSetOptionProc", instance_pos = 0.5)]
    public delegate int DriverSetOptionFunc (Tcl.Interp interp, string option_name, string value);

    [CCode (cname = "Tcl_DriverGetOptionProc", instance_pos = 0.5)]
    public delegate int DriverGetOptionFunc (Tcl.Interp interp, string option_name, Tcl.DString ds);

    [CCode (cname = "Tcl_DriverWatchProc", instance_pos = 0.5)]
    public delegate void DriverWatchFunc (int mask);

    [CCode (cname = "Tcl_DriverGetHandleProc", instance_pos = 0.5)]
    public delegate int DriverGetHandleFunc (int direction, out ClientData handle);

    [CCode (cname = "Tcl_DriverClose2Proc", instance_pos = 0.5)]
    public delegate int DriverClose2Func (Tcl.Interp interp, int flags);

    [CCode (cname = "Tcl_DriverBlockModeProc", instance_pos = 0.5)]
    public delegate int DriverBlockModeFunc (int mode);

    [CCode (cname = "Tcl_DriverFlushProc", instance_pos = 0.5)]
    public delegate int DriverFlushFunc ();

    [CCode (cname = "Tcl_DriverHandlerProc", instance_pos = 0.5)]
    public delegate int DriverHandlerFunc (int interest_mask);

    [CCode (cname = "Tcl_DriverWideSeekProc", instance_pos = 0.5)]
    public delegate Tcl.WideInt DriverWideSeekFunc (Tcl.WideInt offset, int mode, out int error_code);

    [CCode (cname = "Tcl_DriverThreadActionProc", instance_pos = 0.5)]
    public delegate void DriverThreadActionFunc (int action);


    [CCode (cname = "Tcl_DriverTruncateProc", instance_pos = 0.5)]
    public delegate int DriverTruncateFunc (Tcl.WideInt length);

    [CCode (cname = "Tcl_FSPathInFilesystemProc", instance_pos = 0.5)]
    public delegate int FSPathInFilesystemFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSDupInternalRepProc", instance_pos = 0.5)]
    public delegate ClientData FSDupInternalRepFunc ();

    [CCode (cname = "Tcl_FSFreeInternalRepProc", instance_pos = 0.5)]
    public delegate void FSFreeInternalRepFunc ();

    [CCode (cname = "Tcl_FSInternalToNormalizedProc", instance_pos = 0.5)]
    public delegate Tcl.Object FSInternalToNormalizedFunc ();

    [CCode (cname = "Tcl_FSCreateInternalRepProc")]
    public delegate ClientData FSCreateInternalRepFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSNormalizePathProc")]
    public delegate int FSNormalizePathFunc (Tcl.Interp interp, Tcl.Object path, int next_checkpoint);

    [CCode (cname = "Tcl_FSFilesystemPathTypeProc")]
    public delegate Tcl.Object FSFilesystemPathTypeFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSFilesystemSeparatorProc")]
    public delegate Tcl.Object FSFilesystemSeparatorFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSStatProc")]
    public delegate int FSStatFunc (Tcl.Object path, out Tcl.StatBuf buffer);

    [CCode (cname = "Tcl_FSAccessProc")]
    public delegate int FSAccessFunc (Tcl.Object path, int mode);

    [CCode (cname = "Tcl_FSOpenFileChannelProc")]
    public delegate Tcl.Channel FSOpenFileChannelFunc (Tcl.Interp interp, Tcl.Object path, int mode, int permissions);

    [CCode (cname = "Tcl_FSMatchInDirectoryProc")]
    public delegate int FSMatchInDirectoryFunc (Tcl.Interp interp, Tcl.Object result, Tcl.Object path, string pattern, Tcl.GlobTypeData types);

    [CCode (cname = "Tcl_FSUtimeProc")]
    public delegate int FSUtimeFunc (Tcl.Object path, Tcl.UtimeBuf tval);

    [CCode (cname = "Tcl_FSLinkProc")]
    public delegate Tcl.Object FSLinkFunc (Tcl.Object path, Tcl.Object to, int link_type);

    [CCode (cname = "Tcl_FSListVolumesProc")]
    public delegate Tcl.Object FSListVolumesFunc ();

    [CCode (cname = "Tcl_FSFileAttrStringsProc")]
    public delegate unowned string FSFileAttrStringsFunc (Tcl.Object path, out Tcl.Object object);

    [CCode (cname = "Tcl_FSFileAttrsGetProc")]
    public delegate int FSFileAttrsGetFunc (Tcl.Interp interp, int index, Tcl.Object path, out Tcl.Object object);

    [CCode (cname = "Tcl_FSFileAttrsSetProc")]
    public delegate int FSFileAttrsSetFunc (Tcl.Interp interp, int index, Tcl.Object path, Tcl.Object object);

    [CCode (cname = "Tcl_FSCreateDirectoryProc")]
    public delegate int FSCreateDirectoryFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSRemoveDirectoryProc")]
    public delegate int FSRemoveDirectoryFunc (Tcl.Object path, int recursive, out Tcl.Object error);

    [CCode (cname = "Tcl_FSDeleteFileProc")]
    public delegate int FSDeleteFileFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSCopyFileProc")]
    public delegate int FSCopyFileFunc (Tcl.Object src, Tcl.Object dest);

    [CCode (cname = "Tcl_FSRenameFileProc")]
    public delegate int FSRenameFileFunc (Tcl.Object src, Tcl.Object dest);

    [CCode (cname = "Tcl_FSCopyDirectoryProc")]
    public delegate int FSCopyDirectoryFunc (Tcl.Object src, Tcl.Object dest, out Tcl.Object error);

    [CCode (cname = "Tcl_FSLstatProc")]
    public delegate int FSLstatFunc (Tcl.Object path, out Tcl.StatBuf buffer);

    [CCode (cname = "Tcl_FSLoadFileProc")]
    public delegate int FSLoadFileFunc (Tcl.Interp interp, Tcl.Object path, Tcl.LoadHandle handle, out Tcl.FSUnloadFileFunc unload_file_func);

    [CCode (cname = "Tcl_FSGetCwdProc")]
    public delegate Tcl.Object FSGetCwdFunc (Tcl.Interp interp);

    [CCode (cname = "Tcl_FSChdirProc")]
    public delegate int FSChdirFunc (Tcl.Object path);

    [CCode (cname = "Tcl_FSUnloadFileProc")]
    public delegate void FSUnloadFileFunc (Tcl.LoadHandle handle);

    /*
    * define tcl object type
    */

    [Compact]
    [CCode (cname = "Tcl_ObjType", has_type_id = false)]
    public class ObjectType {
        [CCode (cname = "name")]
        string name;

        [CCode (cname = "freeIntRepProc")]
        Tcl.FreeInternalRepFunc? free_internal_rep_func;

        [CCode (cname = "dupIntRepProc")]
        Tcl.DuplicateInternalRepFunc duplicate_internal_rep_func;

        [CCode (cname = "updateStringProc")]
        Tcl.UpdateStringFunc update_string_func;

        [CCode (cname = "setFromAnyProc")]
        Tcl.SetFromAnyFunc set_from_any_func;

        [CCode (cname = "Tcl_RegisterObjType")]
        public void register ();
    }

    /*
    * define some structs used in tcl object
    */

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
    public struct WideInt {}

    [SimpleType]
    [CCode (cname = "ClientData", has_type_id = false)]
    public struct ClientData {}

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

    /*
     * define a tcl object
     */

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

        [CCode (cname = "Tcl_InvalidateStringRep")]
        public void invalidate_string_rep ();
    }

    [CCode (cname = "ImportRef", has_type_id = false)]
    public struct ImportReference {
        [CCode (cname = "importedCmdPtr")]
        Tcl.Command command;

        [CCode (cname = "nextPtr")]
        Tcl.ImportReference? next;
    }

    [CCode (cname = "CommandTrace", has_type_id = false)]
    public struct CommandTrace {

        [CCode (cname = "traceProc")]
        Tcl.CommandTraceFunc trace_func;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "flags")]
        int flags;

        [CCode (cname = "nextPtr")]
        Tcl.CommandTrace? next;

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
        Tcl.HashKeyFunc hash_key_func;

        [CCode (cname = "compareKeysProc")]
        Tcl.CompareHashKeysFunc compare_keys_func;

        [CCode (cname = "allocEntryProc")]
        Tcl.AllocHashEntryFunc alloc_entry_func;

        [CCode (cname = "freeEntryProc")]
        Tcl.FreeHashEntryFunc free_entry_func;
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
        Tcl.CompileFunc compile_func;

        [CCode (cname = "objProc")]
        Tcl.ObjectCommandFunc object_command_func;

        [CCode (cname = "objClientData")]
        Tcl.ClientData object_client_data;

        [CCode (cname = "proc")]
        Tcl.CommandFunc command_func;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "deleteProc")]
        Tcl.CommandDeleteFunc command_delete_func;

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
        unowned string start;

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

    [Compact]
    [CCode (cname = "Tcl_Namespace", free_function = "Tcl_DeleteNamespace", has_type_id = false)]
    public class Namespace {
        [CCode (cname = "name")]
        string name;

        [CCode (cname = "fullName")]
        string full_name;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "deleteProc")]
        Tcl.NamespaceDeleteFunc delete_func;

        [CCode (cname = "parentPtr")]
        Tcl.Namespace parent;

        [CCode (cname = "Tcl_Export", instance_pos = 1.1)]
        public Tcl.Result export (Tcl.Interp interp, string pattern, bool reset_list_first);

        [CCode (cname = "Tcl_Import", instance_pos = 1.1)]
        public Tcl.Result import (Tcl.Interp interp, string pattern, bool allow_overwrite);

        [CCode (cname = "Tcl_ForgetImport", instance_pos = 1.1)]
        public Tcl.Result forget_import (Tcl.Interp interp, string pattern);

        [CCode (cname = "Tcl_CreateNamespace")]
        public Namespace (Tcl.Interp interp, string name, [CCode (cname = "clientData", pos = 2.1)] ClientData? client_data = null, [CCode (cname = "deleteProc", delegate_target_cname = "clientData", delegate_target_pos = 2.1)] Tcl.NamespaceDeleteFunc? delete_func = null);

        [CCode (cname = "Tcl_FindNamespace", instance_pos = 2.1)]
        public Tcl.Namespace find_namespace (Tcl.Interp interp, string namespace_name, int flags);

        [CCode (cname = "Tcl_FindCommand", instance_pos = 2.1)]
        public Tcl.Command find_command (Tcl.Interp interp, string command_name, int flags);

        [CCode (cname = "Tcl_GetNamespaceUnknownHandler", instance_pos = 1.1)]
        public Tcl.Object? get_unknown_handler (Tcl.Interp interp);

        [CCode (cname = "Tcl_SetNamespaceUnknownHandler", instance_pos = 1.1)]
        public Tcl.Result set_unknown_handler (Tcl.Interp interp, Tcl.Object handle);

        [CCode (cname = "Tcl_AppendExportList", instance_pos = 1.1)]
        public Tcl.Result append_export_list (Tcl.Interp interp, Tcl.Object obj);
    }

    [CCode (cname = "Tcl_FSVersion", has_type_id = false)]
    public struct FSVersion {}

    [CCode (cname = "Tcl_GlobTypeData", has_type_id = false)]
    public struct GlobTypeData {
        [CCode (cname = "type")]
        int type;

        [CCode (cname = "perm")]
        int perm;

        [CCode (cname = "macType")]
        Tcl.Object mac_type;

        [CCode (cname = "macCreator")]
        Tcl.Object mac_creator;
    }

    [CCode (cname = "utimbuf", has_type_id = false)]
    public struct UtimeBuf {}

    [CCode (cname = "Tcl_LoadHandle", has_type_id = false)]
    public struct LoadHandle {}

    [CCode (cname = "Tcl_Filesystem", free_function = "", has_type_id = false)]
    public class FileSystem {
        [CCode (cname = "typeName")]
        unowned string name;

        [CCode (cname = "structureLength")]
        int length;

        [CCode (cname = "version")]
        Tcl.FSVersion version;

        [CCode (cname = "pathInFilesystemProc")]
        Tcl.FSPathInFilesystemFunc check_path_in_filesystem_func;

        [CCode (cname = "dupInternalRepProc")]
        Tcl.FSDupInternalRepFunc? duplicate_internal_rep_func;

        [CCode (cname = "freeInternalRepProc")]
        Tcl.FSFreeInternalRepFunc? free_internal_rep_func;

        [CCode (cname = "internalToNormalizedProc")]
        Tcl.FSInternalToNormalizedFunc convert_internal_rep_to_normalized_path_func;

        [CCode (cname = "createInternalRepProc")]
        Tcl.FSCreateInternalRepFunc? create_internal_rep_func;

        [CCode (cname = "normalizePathProc")]
        Tcl.FSNormalizePathFunc normalize_path_func;

        [CCode (cname = "filesystemPathTypeProc")]
        Tcl.FSFilesystemPathTypeFunc? get_path_type_func;

        [CCode (cname = "filesystemSeparatorProc")]
        Tcl.FSFilesystemSeparatorFunc get_separator_func;

        [CCode (cname = "statProc")]
        Tcl.FSStatFunc process_stat_func;

        [CCode (cname = "accessProc")]
        Tcl.FSAccessFunc process_access_func;

        [CCode (cname = "openFileChannelProc")]
        Tcl.FSOpenFileChannelFunc process_open_file_channel_func;

        [CCode (cname = "matchInDirectoryProc")]
        Tcl.FSMatchInDirectoryFunc process_match_in_directory_func;

        [CCode (cname = "utimeProc")]
        Tcl.FSUtimeFunc process_utime_func;

        [CCode (cname = "linkProc")]
        Tcl.FSLinkFunc process_link_func;

        [CCode (cname = "listVolumesProc")]
        Tcl.FSListVolumesFunc list_volumes_func;

        [CCode (cname = "fileAttrStringsProc")]
        Tcl.FSFileAttrStringsFunc list_file_attributes_func;

        [CCode (cname = "fileAttrsGetProc")]
        Tcl.FSFileAttrsGetFunc process_file_attributes_get_func;

        [CCode (cname = "fileAttrsSetProc")]
        Tcl.FSFileAttrsSetFunc process_file_attributes_set_func;

        [CCode (cname = "createDirectoryProc")]
        Tcl.FSCreateDirectoryFunc process_create_directory_func;

        [CCode (cname = "removeDirectoryProc")]
        Tcl.FSRemoveDirectoryFunc process_remove_directory_func;

        [CCode (cname = "deleteFileProc")]
        Tcl.FSDeleteFileFunc process_delete_file_func;

        [CCode (cname = "copyFileProc")]
        Tcl.FSCopyFileFunc process_copy_file_func;

        [CCode (cname = "renameFileProc")]
        Tcl.FSRenameFileFunc process_rename_file_func;

        [CCode (cname = "copyDirectoryProc")]
        Tcl.FSCopyDirectoryFunc process_copy_directory_func;

        [CCode (cname = "lstatProc")]
        Tcl.FSLstatFunc process_lstat_func;

        [CCode (cname = "loadFileProc")]
        Tcl.FSLoadFileFunc process_load_file_func;

        [CCode (cname = "getCwdProc")]
        Tcl.FSGetCwdFunc? process_get_cwd_func;

        [CCode (cname = "chdirProc")]
        Tcl.FSChdirFunc process_chdir_func;
    }

    [CCode (cname = "Tcl_DString", has_type_id = false)]
    public struct DString {
        [CCode (cname = "string")]
        char *string;

        [CCode (cname = "length")]
        int length;

        [CCode (cname = "spaceAvl")]
        int space_avl;

        [CCode (cname = "staticSpace")]
        char staticSpace[200];
    }

    [CCode (cname = "Tcl_EncodingType", has_type_id = false)]
    public struct EncodingType {
        [CCode (cname = "encodingName")]
        unowned string encoding_name;

        [CCode (cname = "toUtfProc")]
        Tcl.EncodingConvertFunc to_utf_func;

        [CCode (cname = "fromUtfProc")]
        Tcl.EncodingConvertFunc from_utf_func;

        [CCode (cname = "freeProc")]
        Tcl.EncodingFreeFunc free_func;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "nullSize")]
        int null_size;
    }

    [CCode (cname = "Tcl_EncodingState", has_type_id = false)]
    public struct EncodingState {}

    [CCode (cname = "struct CloseCallback", cheader_filename = "tclIO.h", has_type_id = false)]
    public struct CloseCallback {
        [CCode (cname = "")]
        Tcl.CloseFunc close_func;

        [CCode (cname = "clientData")]
        ClientData client_data;

        [CCode (cname = "nextPtr")]
        Tcl.CloseCallback? next;
    }

    [CCode (cname = "struct ChannelBuffer", cheader_filename = "tclIO.h", has_type_id = false)]
    public struct ChannelBuffer {
        [CCode (cname = "nextAdded")]
        int next_added;

        [CCode (cname = "nextRemoved")]
        int next_removed;

        [CCode (cname = "bufLength")]
        int buffer_size;

        [CCode (cname = "nextPtr")]
        Tcl.ChannelBuffer? next;

        [CCode (cname = "buf")]
        char buffer[4];
    }

    [CCode (cname = "struct ChannelHandler", cheader_filename = "tclIO.h", has_type_id = false)]
    public struct ChannelHandler {
        [CCode (cname = "chanPtr")]
        Tcl.Channel chan;

        [CCode (cname = "mask")]
        int mask;

        [CCode (cname = "proc")]
        Tcl.ChannelFunc proc;

        [CCode (cname = "clientData")]
        Tcl.ClientData client_data;

        [CCode (cname = "nextPtr")]
        Tcl.ChannelHandler? next;
    }

    [CCode (cname = "struct CopyState", cheader_filename = "tclIO.h", has_type_id = false)]
    public struct CopyState {
        [CCode (cname = "readPtr")]
        Tcl.Channel read_chan;

        [CCode (cname = "writePtr")]
        Tcl.Channel write_chan;

        [CCode (cname = "readFlags")]
        int read_flags;

        [CCode (cname = "writeFlags")]
        int write_flags;

        [CCode (cname = "toRead")]
        int to_read;

        [CCode (cname = "total")]
        Tcl.WideInt total;

        [CCode (cname = "interp")]
        Tcl.Interp interp;

        [CCode (cname = "cmdPtr")]
        Tcl.Object command;

        [CCode (cname = "bufSize")]
        int buffer_size;

        [CCode (cname = "buffer")]
        char buffer[1];
    }

    [CCode (cname = "struct EventScriptRecord", cheader_filename = "tclIO.h", has_type_id = false)]
    public struct EventScriptRecord {
        [CCode (cname = "chanPtr")]
        Tcl.Channel chan;

        [CCode (cname = "scriptPtr")]
        Tcl.Object script;

        [CCode (cname = "interp")]
        Tcl.Interp interp;

        [CCode (cname = "mask")]
        int mask;

        [CCode (cname = "nextPtr")]
        Tcl.EventScriptRecord? next;
    }

    [Compact]
    [CCode (cname = "Tcl_TimerToken", free_function = "Tcl_DeleteTimerHandler", has_type_id = false)]
    public class TimerToken {
        [CCode (cname = "Tcl_CreateTimerHandler")]
        public TimerToken (int milliseconds, owned Tcl.TimerFunc timer_function);
    }

    [CCode (cname = "Tcl_ThreadId", has_type_id = false)]
    public struct ThreadId {}

    [CCode (cname = "Tcl_ChannelTypeVersion", has_type_id = false)]
    public struct ChannelTypeVersion {}

    [CCode (cname = "Tcl_StatBuf", has_type_id = false)]
    public struct StatBuf {}

    [Compact]
    [CCode (cname = "Tcl_Encoding", free_function = "Tcl_FreeEncoding", has_type_id = false)]
    public class Encoding {
        [CCode (cname = "Tcl_CreateEncoding")]
        public Encoding (Tcl.EncodingType type);
    }

    [CCode (cname = "Tcl_ChannelType", has_type_id = false)]
    public struct ChannelType {
        [CCode (cname = "typeName")]
        string type_name;

        [CCode (cname = "version")]
        Tcl.ChannelTypeVersion version;

        [CCode (cname = "closeProc")]
        Tcl.DriverCloseFunc close_func;

        [CCode (cname = "inputProc")]
        Tcl.DriverInputFunc input_func;

        [CCode (cname = "outputProc")]
        Tcl.DriverOutputFunc output_func;

        [CCode (cname = "seekProc")]
        Tcl.DriverSeekFunc? seek_func;

        [CCode (cname = "setOptionProc")]
        Tcl.DriverSetOptionFunc set_option_func;

        [CCode (cname = "getOptionProc")]
        Tcl.DriverGetOptionFunc get_option_func;

        [CCode (cname = "watchProc")]
        Tcl.DriverWatchFunc watch_func;

        [CCode (cname = "getHandleProc")]
        Tcl.DriverGetHandleFunc get_handle_func;

        [CCode (cname = "close2Proc")]
        Tcl.DriverClose2Func close2_func;

        [CCode (cname = "blockModeProc")]
        Tcl.DriverBlockModeFunc? block_mode_func;

        [CCode (cname = "flushProc")]
        Tcl.DriverFlushFunc? flush_func;

        [CCode (cname = "handlerProc")]
        Tcl.DriverHandlerFunc handler_func;

        [CCode (cname = "wideSeekProc")]
        Tcl.DriverWideSeekFunc? wide_seek_func;

        [CCode (cname = "threadActionProc")]
        Tcl.DriverThreadActionFunc? thread_action_func;

        [CCode (cname = "truncateProc")]
        Tcl.DriverTruncateFunc? truncate_func;
    }

    [Compact]
    [CCode (cname = "struct ChannelState", free_function = "", cheader_filename = "tclIO.h", has_type_id = false)]
    public class ChannelState {
        [CCode (cname = "channelName")]
        unowned string chan_name;

        [CCode (cname = "flags")]
        int flags;

        [CCode (cname = "encoding")]
        Tcl.Encoding encoding;

        [CCode (cname = "inputEncodingState")]
        Tcl.EncodingState input_encoding_state;

        [CCode (cname = "inputEncodingFlags")]
        int input_encoding_flags;

        [CCode (cname = "outputEncodingState")]
        Tcl.EncodingState output_encoding_state;

        [CCode (cname = "outputEncodingFlags")]
        int output_encoding_flags;

        [CCode (cname = "inputTranslation")]
        Tcl.Translate input_translation;

        [CCode (cname = "outputTranslation")]
        Tcl.Translate output_translation;

        [CCode (cname = "inEofChar")]
        int in_eof_char;

        [CCode (cname = "outEofChar")]
        int out_eof_char;

        [CCode (cname = "unreportedError")]
        int unreported_error;

        [CCode (cname = "refCount")]
        int ref_count;

        [CCode (cname = "closeCbPtr")]
        Tcl.CloseCallback close_callback;

        [CCode (cname = "outputStage")]
        string output_stage;

        [CCode (cname = "curOutPtr")]
        ChannelBuffer current_output_buffer;

        [CCode (cname = "outQueueHead")]
        Tcl.ChannelBuffer output_queue_head;

        [CCode (cname = "outQueueTail")]
        Tcl.ChannelBuffer output_queue_tail;

        [CCode (cname = "saveInBufPtr")]
        Tcl.ChannelBuffer saved_input_buffer;

        [CCode (cname = "inQueueHead")]
        Tcl.ChannelBuffer input_queue_head;

        [CCode (cname = "inQueueTail")]
        Tcl.ChannelBuffer input_queue_tail;

        [CCode (cname = "chPtr")]
        Tcl.ChannelHandler chan_handler;

        [CCode (cname = "interestMask")]
        int interest_mask;

        [CCode (cname = "scriptRecordPtr")]
        Tcl.EventScriptRecord script_record;

        [CCode (cname = "bufSize")]
        int buffer_size;

        [CCode (cname = "timer")]
        Tcl.TimerToken timer;

        [CCode (cname = "csPtrR")]
        Tcl.CopyState copy_state_read;

        [CCode (cname = "csPtrW")]
        Tcl.CopyState copy_state_write;

        [CCode (cname = "topChanPtr")]
        Tcl.Channel top_chan;

        [CCode (cname = "bottomChanPtr")]
        Tcl.Channel bottom_chan;

        [CCode (cname = "nextCSPtr")]
        Tcl.ChannelState? next;

        [CCode (cname = "managingThread")]
        Tcl.ThreadId managing_thread;

        [CCode (cname = "chanMsg")]
        Tcl.Object chan_message;

        [CCode (cname = "unreportedMsg")]
        Tcl.Object unreported_message;
    }

    [Compact]
    [CCode (cname = "struct Channel", free_function = "", cheader_filename = "tclIO.h", has_type_id = false)]
    public class Channel {
        [CCode (cname = "state")]
        Tcl.ChannelState state;

        [CCode (cname = "instanceData")]
        public Tcl.ClientData instance_data {
            [CCode (cname = "Tcl_GetChannelInstanceData")] get;
        }

        [CCode (cname = "typePtr")]
        public Tcl.ChannelType type {
            [CCode (cname = "Tcl_GetChannelType")] get;
        }

        public string name {
            [CCode (cname = "Tcl_GetChannelName")] get;
        }

        public Tcl.ThreadId thread_id {
            [CCode (cname = "Tcl_GetChannelThread")] get;
        }

        public int mode {
            [CCode (cname = "Tcl_GetChannelMode")] get;
        }

        public int buffer_size {
            [CCode (cname = "Tcl_GetChannelBufferSize")] get;
            [CCode (cname = "Tcl_SetChannelBufferSize")] set;
        }

        [CCode (cname = "Tcl_GetChannelInstanceData")]
        public ClientData get_instance_data ();

        [CCode (cname = "Tcl_GetChannelType")]
        public Tcl.ChannelType get_type ();

        [CCode (cname = "Tcl_GetChannelName")]
        public string get_name ();

        [CCode (cname = "Tcl_GetChannelHandle")]
        public int get_handle (int direction, ClientData handle);

        [CCode (cname = "Tcl_GetChannelThread")]
        public Tcl.ThreadId get_thread ();

        [CCode (cname = "Tcl_GetChannelMode")]
        public int get_mode ();

        [CCode (cname = "Tcl_GetChannelBufferSize")]
        public int get_buffer_size ();

        [CCode (cname = "Tcl_SetChannelBufferSize")]
        public int set_buffer_size (int size);

        [CCode (cname = "downChanPtr")]
        Tcl.Channel down_chan;

        [CCode (cname = "upChanPtr")]
        Tcl.Channel up_chan;

        [CCode (cname = "inQueueHead")]
        Tcl.ChannelBuffer head_buffer;

        [CCode (cname = "inQueueTail")]
        Tcl.ChannelBuffer tail_buffer;

        [CCode (cname = "Tcl_CreateChannel")]
        public Channel (Tcl.ChannelType chan_type, string chan_name, ClientData instance_data, int mask);

        [CCode (cname = "Tcl_IsChannelShared")]
        public int is_shared ();

        [CCode (cname = "Tcl_CutChannel")]
        public void cut ();

        [CCode (cname = "Tcl_SpliceChannel")]
        public void splice ();

        [CCode (cname = "Tcl_ClearChannelHandlers")]
        public void clear_handlers ();

        [CCode (cname = "Tcl_ChannelBuffered")]
        public int get_buffered ();

        [CCode (cname = "Tcl_NotifyChannel")]
        public int notify (int mask);
    }

    [Compact]
    [CCode (cname = "Tcl_Interp", free_function = "Tcl_DeleteInterp", has_type_id = false)]
    public class Interp {
        [CCode (cname = "result")]
        public string result {
            get { return (string) this._result; }
            set {
                this.free_result ();
                this._result = value.dup ();
                this.free_func = GLib.g_free;
            }
        }

        [CCode (cname = "result")]
        private void* _result;

        [CCode (cname = "freeProc")]
        public GLib.DestroyNotify free_func;

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
        public Tcl.Result get_boolean (string src, out bool ptr);

        [CCode (cname = "Tcl_GetDouble")]
        public Tcl.Result get_double (string src, out double ptr);

        [CCode (cname = "Tcl_GetInt")]
        public Tcl.Result get_int (string src, out int ptr);

        [CCode (cname = "Tcl_AddErrorInfo")]
        public void add_error_info (string message);

        [CCode (cname = "Tcl_AddObjErrorInfo")]
        public void add_object_error_info (string message, int length);

        [CCode (cname = "Tcl_AppendObjToErrorInfo")]
        public void append_object_to_error_info (Tcl.Object object);

        [CCode (cname = "Tcl_SetObjErrorCode")]
        public void set_object_error_code (Tcl.Object object);

        [CCode (cname = "Tcl_SetErrorCode")]
        public void set_error_code (...);

        [CCode (cname = "Tcl_SetErrorCodeVA")]
        public void set_error_code_va (va_list arg_list);

        [CCode (cname = "Tcl_GetReturnOptions")]
        public Tcl.Object get_return_options (int code);

        [CCode (cname = "Tcl_SetReturnOptions")]
        public int set_return_options (Tcl.Object options);

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
        public Tcl.Command create_command (string command_name, owned Tcl.CommandFunc proc);

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
        public Tcl.Result get_alias (string command_name, out Tcl.Interp target_interp, out string target_command_name, [CCode (array_length_cname = "argc", array_length_pos = 3.1)] out string[] argv);

        [CCode (cname = "Tcl_CreateAliasObj")]
        public Tcl.Result create_alias_object (string command_name, out Tcl.Interp target_interp, out string target_command_name, [CCode (array_length_cname = "objc", array_length_pos = 3.1)] out Tcl.Object[] objv);

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

        [CCode (cname = "Tcl_LogCommandInfo")]
        public void log_command_info (string script, string command, int length);

        [CCode (cname = "Tcl_WrongNumArgs")]
        public void wrong_number_args ([CCode (array_length_cname = "objc", array_length_pos = 1.1)] Tcl.Object[] objv, string message);

        [CCode (cname = "Tcl_IsChannelRegistered")]
        public int is_channel_registered (Tcl.Channel channel);

        [CCode (cname = "Tcl_AppendAllObjTypes")]
        public Tcl.Result append_all_object_types (Tcl.Object object);

        [CCode (cname = "Tcl_ConvertToType")]
        public Tcl.Result convert_object_to_type (Tcl.Object object, Tcl.ObjectType type);

        [CCode (cname = "Tcl_GetBooleanFromObj")]
        public Tcl.Result get_boolean_from_object (ref Tcl.Object object, out bool ptr);

        [CCode (cname = "Tcl_GetIntFromObj")]
        public Tcl.Result get_int_from_object (ref Tcl.Object object, out int ptr);

        [CCode (cname = "Tcl_GetDoubleFromObj")]
        public Tcl.Result get_double_from_object (ref Tcl.Object object, out double ptr);

        [CCode (cname = "Tcl_GetLongFromObj")]
        public Tcl.Result get_long_from_object (ref Tcl.Object object, out long ptr);

        [CCode (cname = "Tcl_GetIndexFromObj")]
        public Tcl.Result get_index_from_object (ref Tcl.Object object, string[] table, string msg, int flags, out int index);

        [CCode (cname = "Tcl_CreateNamespace")]
        public Tcl.Namespace create_namespace (string namespace_name, [CCode (cname = "clientData", pos = 2.1)] ClientData? client_data = null, [CCode (cname = "deleteProc", delegate_target_cname = "clientData", delegate_target_pos = 2.1)] Tcl.NamespaceDeleteFunc? delete_func = null);

        [CCode (cname = "Tcl_Export")]
        public Tcl.Result export (Tcl.Namespace ns, string pattern, bool reset_list_first);

        [CCode (cname = "Tcl_Import")]
        public Tcl.Result import (Tcl.Namespace ns, string pattern, bool allow_overwrite);

        [CCode (cname = "Tcl_ForgetImport")]
        public Tcl.Result forget_import (Tcl.Namespace ns, string pattern);

        [CCode (cname = "Tcl_GetCurrentNamespace")]
        public Tcl.Namespace get_current_namespace ();

        [CCode (cname = "Tcl_GetGlobalNamespace")]
        public Tcl.Namespace get_global_namespace ();

        [CCode (cname = "Tcl_FindNamespace")]
        public Tcl.Namespace find_namespace (string namespace_name, Tcl.Namespace context_namespace, int flags);

        [CCode (cname = "Tcl_FindCommand")]
        public Tcl.Command find_command (string command_name, Tcl.Namespace context_namespace, int flags);

        [CCode (cname = "Tcl_GetNamespaceUnknownHandler")]
        public Tcl.Object? get_namespace_unknown_handler (Tcl.Namespace ns);

        [CCode (cname = "Tcl_SetNamespaceUnknownHandler")]
        public Tcl.Result set_namespace_unknown_handler (Tcl.Namespace ns, Tcl.Object handle);

        [CCode (cname = "Tcl_AppendExportList")]
        public Tcl.Result append_export_list (Tcl.Namespace ns, Tcl.Object obj);
    }

    [CCode (cname = "Tcl_FindExecutable")]
    public void find_executable (string argv0);

    [CCode (cname = "Tcl_GetNameOfExecutable")]
    public unowned string get_name_of_executable ();

    [CCode (cname = "Tcl_CommandComplete")]
    public bool is_command_complete (string cmd);

    [CCode (cname = "Tcl_GetVersion")]
    public void get_version (out int major, out int minor, out int patch_level, out int type);

    [CCode (cname = "Tcl_Finalize")]
    public void finalize ();

    [CCode (cname = "Tcl_FinalizeThread")]
    public void finalize_thread ();

    [CCode (cname = "Tcl_ReapDetachedProcs")]
    public void reap_detached_functions ();

    [CCode (cname = "Tcl_GetHostName")]
    public unowned string get_hostname ();

    [CCode (cname = "Tcl_GetServiceMode")]
    public int get_service_mode ();

    [CCode (cname = "Tcl_ServiceAll")]
    public int service_all ();

    [CCode (cname = "Tcl_Exit")]
    public void exit (int status);

    [CCode (cname = "Tcl_Alloc")]
    public string alloc (uint size);

    [CCode (cname = "Tcl_Free")]
    public void free (string ptr);

    [CCode (cname = "Tcl_Realloc")]
    public string realloc (string ptr, uint size);

    [CCode (cname = "Tcl_AttemptAlloc")]
    public string try_alloc (uint size);

    [CCode (cname = "Tcl_AttemptRealloc")]
    public string try_realloc (string ptr, uint size);

    [CCode (cname = "Tcl_Access")]
    public int access (string path, int mode);

    [CCode (cname = "Tcl_Stat")]
    public int stat (string path, out Tcl.StatBuf stat);

    [CCode (cname = "Tcl_Concat")]
    public string concatenate ([CCode (array_length_cname = "argc", array_length_pos = 0.9)] string[] argv);

    [CCode (cname = "Tcl_ConcatObj")]
    public Tcl.Object concatenate_objects ([CCode (array_length_cname = "objc", array_length_pos = 0.9)] Tcl.Object[] objv);

    [CCode (cname = "Tcl_RegisterObjType")]
    public void register_object_type (Tcl.ObjectType object_type);

    [CCode (cname = "Tcl_IsChannelExisting")]
    public int is_channel_existing (string chan_name);

    [CCode (cname = "Tcl_ChannelName")]
    public unowned string get_channel_name (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelVersion")]
    public Tcl.ChannelTypeVersion get_channel_version (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelBlockModeProc")]
    public Tcl.DriverBlockModeFunc get_channel_block_mode_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelCloseProc")]
    public Tcl.DriverCloseFunc get_channel_close_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelClose2Proc")]
    public Tcl.DriverClose2Func get_channel_close2_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelInputProc")]
    public Tcl.DriverInputFunc get_channel_input_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelOutputProc")]
    public Tcl.DriverOutputFunc get_channel_output_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelSeekProc")]
    public Tcl.DriverSeekFunc get_channel_seek_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelWideSeekProc")]
    public Tcl.DriverWideSeekFunc get_channel_wide_seek_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelThreadActionProc")]
    public Tcl.DriverThreadActionFunc get_channel_thread_action_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelTruncateProc")]
    public Tcl.DriverTruncateFunc get_channel_truncate_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelSetOptionProc")]
    public Tcl.DriverSetOptionFunc get_channel_set_option_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelGetOptionProc")]
    public Tcl.DriverGetOptionFunc get_channel_get_option_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelWatchProc")]
    public Tcl.DriverWatchFunc get_channel_watch_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelGetHandleProc")]
    public Tcl.DriverGetHandleFunc get_channel_get_handle_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelFlushProc")]
    public Tcl.DriverFlushFunc get_channel_flush_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_ChannelHandlerProc")]
    public Tcl.DriverHandlerFunc get_channel_handler_func (Tcl.ChannelType chan_type);

    [CCode (cname = "Tcl_GetObjType")]
    public Tcl.ObjectType get_object_type (string type_name);

    [CCode (cname = "Tcl_AllocStatBuf")]
    public Tcl.StatBuf alloc_stat_buffer ();

    [CCode (cname = "Tcl_FSRegister", instance_pos=0.5)]
    public int register_filesystem (ClientData client_data, Tcl.FileSystem filesystem);
}
