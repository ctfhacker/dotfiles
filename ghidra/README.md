# Ghidra keybindings for VIM/IDA-esque bindings

## Install

```
Edit -> Tool Options -> KeyBindings -> Import
```

## Vim

```
Undo : U
Redo : SHIFT+R
Previous in History Buffer (go back) : H 
Next in History Buffer  (go forward) : L
Highlight Forward Slice  : J
Highlight Backward Slice : K
Find : FORWARD_SLASH
Find Data Types : FORWARD_SLASH
```

## IDA

```
Show Function Call Trees    : X (Preferred over the Find References To menu)
Display Function Call Graph : SHIFT+X

Cycle : (byte,word,dword,qword) : D

Rename Variable          : N
Rename Function Variable : N
Rename Function          : N
Rename Symbol            : N
Rename Function          : N

Add Bookmark : M
Show Bookmarks (BookmarkPlugin): Alt+M

Edit Data Type  : Y
Retype Variable : Y

Display Function Graph (FunctionGraphPlugin): SPACEBAR

ASCII Strings : A
```

## Extra

```
Export to C : SHIFT+DELETE
```
