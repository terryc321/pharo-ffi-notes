# pharo-ffi-notes


# foreign interface 

Pharo to C code and back again

```
we put a shared variable called MagicNumber into FFITutorial instance side
even though MagicNumber is shared between classes
not a variable in an instance side ... huh ... 

Object class << FFITutorial class
	slots: {}
	
Object << #FFITutorial
	slots: {};
	sharedVariables: { #MagicNumber };
	package: 'FFI-Tutorial'
		

FFITutorial class >>  ticksSinceStart
	^ self ffiCall: #( ulong clock (  ) ) library: 'libc.so'
	
FFITutorial class >> time
	^ self ffiCall: #( ulong time (  ) ) library: 'libc.so'

FFITutorial class >> abs: n
	^ self ffiCall: #( int abs ( int n ) ) .

FFITutorial class >> initialize
 MagicNumber := -42	
	
``

book tries to generalise away difficulty finding 'libc.so' by replacing with MyLibC 
also mentions cairo so we made another one for that too
FFILibrary << MyLibC     
FFILibrary << MyLibCairo  

MyLibC >> macModuleName
MyLibC >> unixModuleName
MyLibC >> unix64ModuleName
MyLibC >> win32ModuleName
are outdated to be renamed by LibraryName
MyLibC >> macLibraryName
MyLibC >> unixLibraryName
MyLibC >> unix64LibraryName
MyLibC >> win32LibraryName


```
FFITutorial class ticksSinceStart.

```

```
^ self ffiCall: #( int time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'	
^ self ffiCall: #( ulong time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'	

```

Changelog
Created Package FFI-Tutorial class FFITutorial
Created Package Unified-FFI-Libraries class MyLibC
any hypen(s) in class name may confuse smalltalk

1 - inserted new FFITutorial new ticksSinceStart.
2 - changed 


```
f := FFITutorial new.
f ticksSinceStart.
#(f time . f time2). 
{ f time . f time2  }. 
```

"
See Classses defined in Unified-FFI-Libraries package with this XXX
defined two new classes MyLibC and MyLibCairo that 


note about using shared pools - google book  { pharo by example 8.0 }


SharedPool subclass: #FFITutorialPool
...
classVariableNames: 'MagicNumber'
...
FFITutorialPool class >> initialize [
"Set this to -42 because.. Life, the Universe, and Everything."
MagicNumber := -42.
]
Object subclass: #FFITutorial
...
poolDictionaries: 'FFITutorialPool'
...
FFITutorial class >> absMinusFortyTwo [
^ self ffiCall: #( int abs ( int MagicNumber ) )
]
Using a shared pool does not change the normal Pharo usage of uFFI. If you
want to learn more about Pharo shared pools, we recommend you take a look
at Pharo by Example 8.0.

"




