#define Tcl_LessInsaneDecrRefCount(objPtr) ((--(objPtr)->refCount <= 0)?(TclFreeObj(objPtr),NULL):objPtr)
