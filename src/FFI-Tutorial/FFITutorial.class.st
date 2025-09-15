"
```
FFITutorial new ticksSinceStart. #( ""63033001"")
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
CairoLibrary


"
Class {
	#name : 'FFITutorial',
	#superclass : 'Object',
	#category : 'FFI-Tutorial',
	#package : 'FFI-Tutorial'
}

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStart [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
"MyLibC defined in class MyLibC package Unified-FFI-Libraries , no idea why"
"on unix32 bit - MyLibC unixLibraryName "
"on unix64 bit - MyLibC unix64LibraryName "
"on mac  - MyLibC calls macLibraryName "
"on win32 bit - MyLibC calls win32LibraryName ? or should it be win64 ? "
	^ self ffiCall: #( uint clock (  ) ) library: MyLibC
	
]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStartLinux [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'libc.so.6'




]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStartMac [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'libc.dylib'




]

{ #category : 'as yet unclassified' }
FFITutorial >> ticksSinceStartWindows [ 
"call c clock procedure"
^ self ffiCall: #( uint clock() ) library: 'msvcrt.dll'




]

{ #category : 'as yet unclassified' }
FFITutorial >> time [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
	^ self ffiCall: #( uint time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libcairo.so'
	


	
]

{ #category : 'as yet unclassified' }
FFITutorial >> time2 [
"call c procedure - through indirection MyLibC which is defined under Unified-FFI-Libraries package ... huh"
	"^ self ffiCall: #( uint time ( NULL ) ) library: MyLibC"
	^ self ffiCall: #( uint time ( NULL ) ) library: '/usr/lib/x86_64-linux-gnu/libc.so'.
	
	


	
]
